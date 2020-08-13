% Counterfactual(s) of different sunk costs of incumbents
delete 'Diary_cf_sunkcost'; diary('Diary_cf_sunkcost');

global beta delta State Exit Adopt T Pi V EV Policy;
load CheckPi.mat;

% Basic parameters
scaling = 1000;     % Re-scale profits, to avoid explosion due to exp(pi) or exp(EV)
beta = .80;         % Discount factor
delta = 1.10;      % Decline in SC (= MC_new's drop rate)
potent = 4;         % Number of potential entrants (assumption) for all years
State(:,4) = potent*ones(18,1);
T = size(State,1);  % Number of periods (years)

% Simulation parameters (MLE of beta = .80, npe =4, delta = 1.10)
phi = -0.147362421730779;
kappa_inc = 1.24394591815957;
kappa_ent = 2.25381667717391;
Theta = [phi, kappa_inc, kappa_ent];

fprintf('\n  --------------------------------------------');
fprintf('\n | COUNTERFACTUAL(S): TRY DIFFERENT KAPPA_INC |');
fprintf('\n  --------------------------------------------');

fprintf('\n ----- Basic parameters to be "calibrated" -----');
fprintf('\n   Profit/value scaling      :     %4.0f', scaling);
fprintf('\n   Discount factor (beta)    :     %1.4f', beta);
fprintf('\n   Adoption cost drop (delta):     %1.4f', delta);
fprintf('\n   # potential entrants (Npe):     %1.0f', potent);
fprintf('\n -----------------------------------------------');
fprintf('\n');
fprintf('\n ------------ Estimated parameters -------------');
fprintf('\n   Operating fixed cost      :     %1.4f', phi);
fprintf('\n   Base SC for incumbents = {0, 0.05, 0.10, ..., 1.15, 1.20}');
fprintf('\n   Base SC for entrants      :     %1.4f', kappa_ent);
fprintf('\n -----------------------------------------------');
fprintf('\n');

% Profit scaling (Dan: "Treating data as parameters") & Value
Pi = Pi / scaling;  % Re-scaling profits, to avoid:
                    % (1) explosion of NaN's & (2) dominance of logit errors.
                   
% Terminal Values
V = zeros(T,3,12,12,15);     % Values (expected values, with expectation over shocks)
V(T,:,:,:,:) = Pi(T,:,:,:,:) / (1 - beta);  % V(T) pinned down by Pi(T)

% Initialize Solutions
EV = zeros(T,5,12,12,15);    % Expected values (expectation is over states)
Policy = zeros(T-1,5,12,12,15);% Choice probabilities

% Solve the model, to simulate innovation timing and state evolution
% Initialization
ngrid = 25;                         % Number of different kappa_inc values to try
grid = zeros(ngrid,1);              % Record the values of kappa_inc
Big_State_avg = zeros(18,4,ngrid);  % Record the average state evolution
Big_Adopt_avg = zeros(18,2,ngrid);  % Record the average innovation timing

% Prepare simulation draws for 10,000 histories (for each of the kappa_inc values)
NS = 10000;                     % Number of simulations
npe = 4;                        % Number of potential entrants every year
State_simu = zeros(18,4,NS);    % Simulated history
Adopt_simu = zeros(18,2,NS);    % Simulated innovation decisions
seed = 645456;                  % Seed for random draws
rng(seed);                      % Set seed
U = rand(36+npe,17,NS);             % NS draws from U(0,1) to simulate each firm's discrete choice over 17 years
Uo = U(1:11,:,:);
Ub = U(12:22,:,:);
Un = U(23:36,:,:);
Upe= U(37:40,:,:);
Xo = zeros(11,17,NS);           % Number of exits among old-only firms
Eo = zeros(11,17,NS);           % Number of innovators among old-only firms
Xb = zeros(11,17,NS);           % Number of exits among both
Xn = zeros(14,17,NS);           % Number of exits among new-only
Epe= zeros(npe,17,NS);          % Number of innovators among potential entrants
xo = zeros(17,NS);
eo = zeros(17,NS);
xb = zeros(17,NS);
xn = zeros(17,NS);
epe= zeros(17,NS);

% Perturb kappa_inc
fprintf('\n ----------------------------');
fprintf('\n Perturbing kappa_inc...')
i = 1;
for k = 0:0.05:1.20                 % For each of the kappa_inc values...
    grid(i) = k;
    x0 = [phi, k, kappa_ent];
    ll = feval(@Likelihood,x0,1);   % Solve the game once
    %fprintf('\n If kappa_inc = %1.2f, log likelihood = %3.4f', k, ll)
    
    % Run 10,000 simulations
    warning off;
    for ns = 1:NS                   % Loop 1: for each simulated history...
    %fprintf('\n Simulating history #%5.0f', ns);
    State_simu(1,:,ns) = State(1,:);    % Year 1 is given by data
    State_simu(:,4,ns) = npe*ones(18,1);% N_pe is fixed by assumption    

        for t = 1:17                % Loop 2: for each year
            No = State_simu(t,1,ns);% Current state is given
            Nb = State_simu(t,2,ns);
            Nn = State_simu(t,3,ns);
            Npe = State_simu(t,4,ns);
        
            PrXo = Policy(t,1,No+1,Nb+1,Nn+1);  % Estimated optimal choice probabilities
            PrEo = Policy(t,2,No+1,Nb+1,Nn+1);
            PrXb = Policy(t,3,No+1,Nb+1,Nn+1);
            PrXn = Policy(t,4,No+1,Nb+1,Nn+1);
            PrEpe = Policy(t,5,No+1,Nb+1,Nn+1);
        
            if No > 0
                Xo(1:No,t,ns) = 1*(Uo(1:No,t,ns) < PrXo*ones(1:No,1));  % Old's exit decision
                xo(t,ns) = sum(Xo(1:No,t,ns),1);                        % Count of old's exits
                Eo(1:No,t,ns) = 1*(Uo(1:No,t,ns) > (1-PrEo)*ones(1:No,1));% Old's innovation decision
                eo(t,ns) = sum(Eo(1:No,t,ns),1);                        % Count of old's innovations
            else
                xo(t,ns) = 0;
                eo(t,ns) = 0;
            end
        
            if Nb > 0
                Xb(1:Nb,t,ns) = 1*(Ub(1:Nb,t,ns) < PrXb*ones(1:Nb,1));  % Both's exit decision
                xb(t,ns) = sum(Xb(1:Nb,t,ns),1);                        % Count of both's exits
            else
                xb(t,ns) = 0;
            end
        
            if Nn > 0
                Xn(1:Nn,t,ns) = 1*(Un(1:Nn,t,ns) < PrXn*ones(1:Nn,1));  % New's exit decision
                xn(t,ns) = sum(Xn(1:Nn,t,ns),1);                        % Count of new's exits
            else
                xn(t,ns) = 0;
            end
        
            if Npe > 0
                Epe(1:Npe,t,ns) = 1*(Upe(1:Npe,t,ns) < PrEpe*ones(1:Npe,1));% Entrants' innovation
                epe(t,ns) = sum(Epe(1:Npe,t,ns),1);                         % Count of entries
            else
                epe(t,ns) = 0;
            end
        
            State_simu(t+1,1,ns) = No - xo(t,ns) - eo(t,ns);    % No_prime
            State_simu(t+1,2,ns) = Nb - xb(t,ns) + eo(t,ns);    % Nb_prime
            State_simu(t+1,3,ns) = min([14, Nn - xn(t,ns) + epe(t,ns)]);    % Nn_prime (capped at 14)
            Adopt_simu(t+1,1:2,ns) = [eo(t,ns),epe(t,ns)];      % Counts of innovations
        end
    end
    warning on;

    State_avg = sum(State_simu,3) / NS;     % Average over NS simulated histories
    State_avg_rd = round(State_avg);        % Rounding firm counts to integers
    Adopt_avg = sum(Adopt_simu,3) / NS;
    Adopt_avg_rd = round(Adopt_avg);
    
    % Record the summary outcomes
    Big_State_avg(:,:,i) = State_avg(:,:);
    Big_Adopt_avg(:,:,i) = Adopt_avg(:,:);
    
    % Raise the index for the next value of kappa_inc
    i = i+1;
end
fprintf('\n ----------------------------');
fprintf('\n');

% Save the main results
save Result_cf_sunkcost.mat grid Big_State_avg Big_Adopt_avg;
diary off;
