function f = Likelihood(Theta,output_type)

% This version (no-cannibalization): 6/8/2011 --> 9/7/2011 (no major change)

global beta delta t phi kappa_inc kappa_ent...
    State Exit Adopt T V Pi iterMLE EV Policy LL;

phi = Theta(1);
kappa_inc = Theta(2);
kappa_ent = Theta(3);

fprintf('\nMLE iter #%4.0f: trying (phi, kappa_inc, kappa_ent)\n', iterMLE)
fprintf(' = (%8.8f, %8.8f, %8.8f)\n', phi, kappa_inc, kappa_ent)

%tic;

% Solving the "game" backwards for expected values & choice probabilities
% For each year...
for t = (T-1):-1:1
tic;

    % Given tomorrow's values (in every state tomorrow)...
    Vprime = zeros(103680,1); % 103680 = 4x12x12x15x12 (type,No',Nb',Nn',Nroo')
    for type = 0:3
        for no_prime = 0:11
            for nb_prime = 0:11
                for nn_prime = 0:14
                    for nroo_prime = 0:11
                        
    Vprime(1 + type + 4*no_prime + 4*12*nb_prime + 4*12*12*nn_prime + 4*12*12*15*nroo_prime)...
        = V(t+1, type+1, no_prime+1, nb_prime+1, nn_prime+1, nroo_prime+1);
    
                    end
                end
            end
        end
    end
    
    No = State(t,1);            % Today's # of Old-only firms
    Nb = State(t,2);            % Today's # of Both-type firms
    Nn = State(t,3);            % Today's # of New-only firms
    Npe = State(t,4);           % Today's # of Potential Entrants
    Npe_prime = State(t+1,4);   % Tomorrow's # of Potential Entrants
    Nroo = State(t,1);
        
    fprintf('\nLikelihood at t = %2.0f \n', t)
    statenum = 1;
    
    for no = 0:11               % Circle around Today's # of Old firms
        for nb = 0:11           % Circle around Today's # of Both firms
            for nn = 0:14       % Circle around Today's # of New firms
                for nroo = 0:11 % Circle around Today's # of Really-Old-Only's (Legacy division)
                
                % Solve for Nash Equilibrium
                gap = 666;
                iterNE = 0;
                
                % Initialize EV1 - EV6 with tomorrow's actual state
                if no > 0
                    z1 = V(t+1, 1, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1, State(t+1,1)+1);
                    z2 = V(t+1, 2, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1, State(t+1,1)+1);
                    else z1 = 0; z2 = 0; end
                if nb > 0
                    z3 = V(t+1, 2, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1, State(t+1,1)+1);
                    else z3 = 0; end
                if nn > 0
                    z4 = V(t+1, 3, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1, State(t+1,1)+1);
                    else z4 = 0; end
                if Npe > 0
                    z5 = V(t+1, 3, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1, State(t+1,1)+1);
                    else z5 = 0; end
                if Nroo > 0
                    z0 = V(t+1, 4, State(t+1,1)+1, State(t+1,2)+1, State(t+1,3)+1, State(t+1,1)+1);
                    else z0 = 0; end
                 
                % Initialize Policies from the initial EV1 - EV6
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
                if Nroo > 0
                    z00old = fun00(z0, beta, phi);
                    else z00old = 0; end
                
                % Iterate: Beliefs --> Policies --> Beliefs --> Policies...
                while (gap > .01 && iterNE < 10)   
                 
                    if no > 0
                        z1 = fun1(z6old, z7old, z8old, z9old, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime, z00old, nroo);
                        z2 = fun2(z6old, z7old, z8old, z9old, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime, z00old, nroo);
                        z6 = (fun6(z1, z2, beta, phi, kappa_inc, delta, t) + z6old)/2;
                        z7 = (fun7(z1, z2, beta, phi, kappa_inc, delta, t) + z7old)/2;
                        else z1 = 0; z2 = 0; z6 = 0; z7 = 0; end
                    if nb > 0
                        z3 = fun3(z6, z7, z8old, z9old, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime, z00old, nroo);
                        z8 = (fun8(z3, beta, phi) + z8old)/2;
                        else z3 = 0; z8 = 0; end
                    if nn > 0
                        z4 = fun4(z6, z7, z8, z9old, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime, z00old, nroo);
                        z9 = (fun9(z4, beta, phi) + z9old)/2;
                        else z4 = 0; z9 = 0; end
                    if Npe > 0
                        z5 = fun5(z6, z7, z8, z9, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime, z00old, nroo);
                        z10 = (fun10(z5, beta, kappa_ent, delta, t) + z10old)/2;
                        else z5 = 0; z10 = 0; end
                    if nroo > 0
                        z0 = fun0(z6, z7, z8, z9, z10old,...
                            no, nb, nn, Npe, Npe_prime, Vprime, z00old, nroo);
                        z00 = (fun00(z0, beta, phi) + z00old)/2;
                        else z0 = 0; z00 = 0; end
                    
                    gap = abs(z6 - z6old) + abs(z7 - z7old) + abs(z8 - z8old)...
                        + abs(z9 - z9old) + abs(z10 - z10old) + abs(z00 - z00old);
                    
                    % Update
                    z6old = z6; z7old = z7; z8old = z8; z9old = z9; z10old = z10; 
                    z00old = z00;
                    iterNE = iterNE + 1;                    
                end
                
                EV(t+1,:,no+1,nb+1,nn+1,nroo+1) = [z1 z2 z3 z4 z5 z0];
                Policy(t,:,no+1,nb+1,nn+1,nroo+1) = [z6 z7 z8 z9 z10 z00];

if no > 0
V(t,1,no+1,nb+1,nn+1,nroo+1) = Pi(t,1,no+1,nb+1,nn+1,nroo+1) + 0.57722 +...
    fun11(z1, z2, beta, phi, kappa_inc, delta, t);
    %log(exp(0) + exp(phi + beta * EV(t+1,1,no+1,nb+1,nn+1,nroo+1)) +...
    %exp(phi + beta * EV(t+1,2,no+1,nb+1,nn+1,nroo+1) - kappa_inc));
else V(t,1,no+1,nb+1,nn+1,nroo+1) = 0; end

if nb > 0
V(t,2,no+1,nb+1,nn+1,nroo+1) = Pi(t,2,no+1,nb+1,nn+1,nroo+1) + 0.57722 +...
    fun12(z3, beta, phi);
    %log(exp(0) + exp(phi + beta * EV(t+1,3,no+1,nb+1,nn+1,nroo+1)));
else V(t,2,no+1,nb+1,nn+1) = 0; end

if nn > 0
V(t,3,no+1,nb+1,nn+1,nroo+1) = Pi(t,3,no+1,nb+1,nn+1,nroo+1) + 0.57722 +...
    fun13(z4, beta, phi);
    %log(exp(0) + exp(phi + beta * EV(t+1,4,no+1,nb+1,nn+1,nroo+1)));
else V(t,3,no+1,nb+1,nn+1,nroo+1) = 0; end

if nroo > 0
V(t,4,no+1,nb+1,nn+1,nroo+1) = Pi(t,4,no+1,nb+1,nn+1,nroo+1) + 0.57722 +...
    fun14(z0, beta, phi);
    %log(exp(0) + exp(phi + beta * EV(t+1,6,no+1,nb+1,nn+1,nroo+1)));
else V(t,4,no+1,nb+1,nn+1,nroo+1) = 0; end

                statenum = statenum + 1;
                end
            end
        end
    end

    fprintf('\nDone. Elapsed time = ')
    toc;
    
        end

% Finish
LL = 12345;  % Just can't calculate likelihood b/c no "real-old-only" exists in data!

if output_type == 1; f = -LL;    % for estimation (for maximizing likelihood)
elseif output_type == 2; f = LL; % for calculating standard errors
end;

% Display the convergence process
%fprintf('Done: MLE iter #%4.0f: (phi, kappa_inc, kappa_ent)\n', iterMLE)
%fprintf(' = (%8.8f, %8.8f, %8.8f)\n', phi, kappa_inc, kappa_ent)
fprintf('Done:    - Log Likelihood = %10.10f \n', -LL)

%fprintf('Elapsed time = ')
%toc;

iterMLE = iterMLE + 1;
