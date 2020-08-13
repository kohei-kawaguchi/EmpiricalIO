function f = Likelihood(Theta,output_type)

% This version: 10/14/2013

global beta delta t phi kappa_inc kappa_ent...
    State Exit Adopt T V Pi iterMLE EV Policy LL;

phi = Theta(1);
kappa_inc = Theta(2);
kappa_ent = Theta(3);

fprintf('\nMLE iter #%4.0f: trying (phi, kappa_inc, kappa_ent)\n', iterMLE)
fprintf(' = (%8.8f, %8.8f, %8.8f)\n', phi, kappa_inc, kappa_ent)

tic;

% Solving the "game" backwards for expected values & choice probabilities
% For each year...
for t = (T-1):-1:1
%tic;

    % Given tomorrow's values (in every state tomorrow)...
    Vprime = zeros(6480,1); % 6480 = 3 x 12 x 12 x 15 (type, No', Nb', Nn')
    for type = 0:2
        for no_prime = 0:11
            for nb_prime = 0:11
                for nn_prime = 0:14
                    Vprime(1 + type + 3*no_prime + 3*12*nb_prime + 3*12*12*nn_prime)...
                        = V(t+1, type+1, no_prime+1, nb_prime+1, nn_prime+1);
                end
            end
        end
    end
    
    No = State(t,1);            % Today's # of Old-only firms
    Nb = State(t,2);            % Today's # of Both-type firms
    Nn = State(t,3);            % Today's # of New-only firms
    Npe = State(t,4);           % Today's # of Potential Entrants
    Npe_prime = State(t+1,4);   % Tomorrow's # of Potential Entrants
        
%    fprintf('\nLikelihood at t = %2.0f \n', t)
    statenum = 1;
    
    for no = 0:11               % Circle around Today's # of Old firms
        for nb = 0:11           % Circle around Today's # of Both firms
            for nn = 0:14       % Circle around Today's # of New firms
                
%fprintf('\n  Solving for N.E. in year %2.0f, state #%5.0f (of 9375): \n'...
%    , t, statenum);
%fprintf('    (no, nb, nn, Npe, Npe_prime) = (%2.0f,%2.0f,%2.0f,%2.0f,%2.0f) \n'...
%    , no, nb, nn, Npe, Npe_prime);    
                
                % Solve for Nash Equilibrium
                gap = 666;
                iterNE = 0;
                
                % Initialize EV1 - EV5 with tomorrow's actual state
                if no > 0
                    z1 = V(t+1, 1, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1);
                    z2 = V(t+1, 2, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1);
                    else z1 = 0; z2 = 0; end
                if nb > 0
                    z3 = V(t+1, 2, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1);
                    else z3 = 0; end
                if nn > 0
                    z4 = V(t+1, 3, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1);
                    else z4 = 0; end
                if Npe > 0
                    z5 = V(t+1, 3, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1);
                    else z5 = 0; end
                 
                % Initialize Policies from the initial EV1 - EV5
                if no > 0
                    z6old = fun6(z1, z2, beta, phi, kappa_inc, delta, t);
                    z7old = fun7(z1, z2, beta, phi, kappa_inc, delta, t);
                    else z6old = 0; z7old = 0; end
                if nb > 0
                    z8old = fun8(z3, beta, phi);
                    else z8old = 0; end
                if nn > 0
                    z9old = fun9(z4, beta, phi);
                    else z9old = 0; end
                if Npe > 0
                    z10old = fun10(z5, beta, kappa_ent, delta, t);
                    else z10old = 0; end
                
                % Iterate: Beliefs --> Policies --> Beliefs --> Policies...
                while (gap > .01 && iterNE < 10)   
                 
                    if no > 0
                        z1 = fun1(z6old, z7old, z8old, z9old, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime);
                        z2 = fun2(z6old, z7old, z8old, z9old, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime);
                        z6 = (fun6(z1, z2, beta, phi, kappa_inc, delta, t) + z6old)/2;
                        z7 = (fun7(z1, z2, beta, phi, kappa_inc, delta, t) + z7old)/2;
                        else z1 = 0; z2 = 0; z6 = 0; z7 = 0; end
                    if nb > 0
                        z3 = fun3(z6, z7, z8old, z9old, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime);
                        z8 = (fun8(z3, beta, phi) + z8old)/2;
                        else z3 = 0; z8 = 0; end
                    if nn > 0
                        z4 = fun4(z6, z7, z8, z9old, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime);
                        z9 = (fun9(z4, beta, phi) + z9old)/2;
                        else z4 = 0; z9 = 0; end
                    if Npe > 0
                        z5 = fun5(z6, z7, z8, z9, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime);
                        z10 = (fun10(z5, beta, kappa_ent, delta, t) + z10old)/2;
                        else z5 = 0; z10 = 0; end
                    
                    gap = abs(z6 - z6old) + abs(z7 - z7old) + abs(z8 - z8old)...
                        + abs(z9 - z9old) + abs(z10 - z10old);
                    
%if (iterNE < 3 || iterNE > 97)
%fprintf('\n    NE iter #%4.0f: EV (z1,z2,z3,z4,z5) = (%4.2f, %4.2f, %4.2f, %4.2f, %4.2f) \n'...
%    , iterNE, z1, z2, z3, z4, z5)
%fprintf('         Choice Prob (z6,z7,z8,z9,z10) = (%0.4f, %0.4f, %0.4f, %0.4f, %0.4f) \n'...
%    , z6, z7, z8, z9, z10)
%fprintf('         gap = %0.4f \n', gap)
%end
                    
                    % Update
                    z6old = z6; z7old = z7; z8old = z8; z9old = z9; z10old = z10; 
                    iterNE = iterNE + 1;                    
                end
                
                EV(t+1,:,no+1,nb+1,nn+1) = [z1 z2 z3 z4 z5];
                Policy(t,:,no+1,nb+1,nn+1) = [z6 z7 z8 z9 z10];

if no > 0
V(t,1,no+1,nb+1,nn+1) = Pi(t,1,no+1,nb+1,nn+1) + 0.57722 +...
    fun11(z1, z2, beta, phi, kappa_inc, delta, t);
    %log(exp(0) + exp(phi + beta * EV(t+1,1,no+1,nb+1,nn+1)) +...
    %exp(beta * EV(t+1,2,no+1,nb+1,nn+1) - kappa_inc));
else V(t,1,no+1,nb+1,nn+1) = 0; end

if nb > 0
V(t,2,no+1,nb+1,nn+1) = Pi(t,2,no+1,nb+1,nn+1) + 0.57722 +...
    fun12(z3, beta, phi);
    %log(exp(0) + exp(phi + beta * EV(t+1,3,no+1,nb+1,nn+1)));
else V(t,2,no+1,nb+1,nn+1) = 0; end

if nn > 0
V(t,3,no+1,nb+1,nn+1) = Pi(t,3,no+1,nb+1,nn+1) + 0.57722 +...
    fun13(z4, beta, phi);
    %log(exp(0) + exp(phi + beta * EV(t+1,4,no+1,nb+1,nn+1)));
else V(t,3,no+1,nb+1,nn+1) = 0; end

%fprintf('\n   Expected V (z1,z2,z3,z4,z5) = (%4.2f, %4.2f, %4.2f, %4.2f, %4.2f) \n'...
%                        , z1, z2, z3, z4, z5)
%fprintf(' Choice Prob (z6,z7,z8,z9,z10) = (%0.4f, %0.4f, %0.4f, %0.4f, %0.4f) \n'...
%                        , z6, z7, z8, z9, z10)
%fprintf('\n   Values today (Vo, Vb, Vn) = (%4.2f, %4.2f, %4.2f) \n'...
%                        , V(t,1,no+1,nb+1,nn+1), V(t,2,no+1,nb+1,nn+1), V(t,3,no+1,nb+1,nn+1))
                    
                statenum = statenum + 1;
            end
        end
    end

%    fprintf('\nDone. Elapsed time = ')
%    toc;
    
end

% Joint choice probabilities:
% Log likelihood of observing choices in data, for each period & type
LL = zeros(T-1,4);    

for t = 1:(T-1)    % Originally 1, not 15 (for debugging only)
    
    No = State(t,1);            % Today's # of Old-only firms
    Nb = State(t,2);            % Today's # of Both-type firms
    Nn = State(t,3);            % Today's # of New-only firms
    Npe = State(t,4);           % Today's # of Potential Entrants
    Npe_prime = State(t+1,4);   % Tomorrow's # of Potential Entrants
    fprintf('\nActual state in year %2.0f: (No, Nb, Nn, Npe, Npe_prime) = (%2.0f,%2.0f,%2.0f,%2.0f,%2.0f)\n'...
        , t, No, Nb, Nn, Npe, Npe_prime);
    
    % Choice probabilities in actual state at t
    a6 = Policy(t, 1, No+1, Nb+1, Nn+1);
    a7 = Policy(t, 2, No+1, Nb+1, Nn+1);
    a8 = Policy(t, 3, No+1, Nb+1, Nn+1);
    a9 = Policy(t, 4, No+1, Nb+1, Nn+1);
    a10 = Policy(t, 5, No+1, Nb+1, Nn+1);
    fprintf('Policies: Prob(Xo, Eo, Xb, Xn, En) = (%1.4f,%1.4f,%1.4f,%1.4f,%1.4f)\n'...
        , a6, a7, a8, a9, a10);
    
    % Avoid "log(0) = -Inf" in Log Likelihood calculation
    if a6 < .0001; a6 = .0001; end
    if a7 < .0001; a7 = .0001; end
    if a8 < .0001; a8 = .0001; end
    if a9 < .0001; a9 = .0001; end
    if a10< .0001; a10= .0001; end
    
    % Log likelihood
    LL(t,1) = Exit(t,1) * log(a6) + Adopt(t,1) * log(a7) +...
        (State(t,1) - Exit(t,1) - Adopt(t,1)) * log(1 - a6 - a7);
    LL(t,2) = Exit(t,2) * log(a8) + (State(t,2) - Exit(t,2)) * log(1 - a8);
    LL(t,3) = Exit(t,3) * log(a9) + (State(t,3) - Exit(t,3)) * log(1 - a9);
    LL(t,4) = Adopt(t,2) * log(a10) + (State(t,4) - Adopt(t,2)) * log(1 - a10);    
    fprintf('Log likelihood = %10.4f \n', sum(LL(t,:)))
    
end

LL = sum(sum(LL));  % Sum log likelihoods over periods & types

if output_type == 1; f = -LL;    % for estimation (for maximizing likelihood)
elseif output_type == 2; f = LL; % for calculating standard errors
end;

% Display the convergence process
%fprintf('Done: MLE iter #%4.0f: (phi, kappa_inc, kappa_ent)\n', iterMLE)
%fprintf(' = (%8.8f, %8.8f, %8.8f)\n', phi, kappa_inc, kappa_ent)
fprintf('Done:    - Log Likelihood = %10.10f \n', -LL)

fprintf('Elapsed time = ')
toc;

iterMLE = iterMLE + 1;
