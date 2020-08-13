% Construct Confidence Intervals based on Likelihood Ratios
delete 'Diary_CI'; diary('Diary_CI');

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

fprintf('\n  -----------------------------------------');
fprintf('\n |          CONFIDENCE INTERVALS           |');
fprintf('\n  -----------------------------------------');

fprintf('\n ----- Basic parameters to be "calibrated" -----');
fprintf('\n   Profit/value scaling      :     %4.0f', scaling);
fprintf('\n   Discount factor (beta)    :     %1.4f', beta);
fprintf('\n   Adoption cost drop (delta):     %1.4f', delta);
fprintf('\n   # potential entrants (Npe):     %1.0f', potent);
fprintf('\n -----------------------------------------------');
fprintf('\n');
fprintf('\n ------------ Estimated parameters -------------');
fprintf('\n   Operating fixed cost      :     %1.4f', phi);
fprintf('\n   Base SC for incumbents    :     %1.4f', kappa_inc);
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

% Solve the model, to evaluate log likelihood
% Initialization
LL_1 = zeros(101,1);
LL_2 = zeros(101,1);
LL_3 = zeros(101,1);
grid_1 = zeros(101,1);
grid_2 = zeros(101,1);
grid_3 = zeros(101,1);

% Perturb phi
fprintf('\n ----------------------------');
fprintf('\n Perturbing phi...')
i = 1;
for k = -0.65:0.01:0.35
    grid_1(i) = k;
    x0 = [k, kappa_inc, kappa_ent];
    ll = feval(@Likelihood,x0,1);
    %fprintf('\n If phi = %1.2f, log likelihood = %3.4f', k, ll)
    LL_1(i) = ll;
    i = i+1;
end

% Perturb kappa_inc
fprintf('\n ----------------------------');
fprintf('\n Perturbing kappa_inc...')
i = 1;
for k = 0.74:0.01:1.74
    grid_2(i) = k;
    x0 = [phi, k, kappa_ent];
    ll = feval(@Likelihood,x0,1);
    %fprintf('\n If kappa_inc = %1.2f, log likelihood = %3.4f', k, ll)
    LL_2(i) = ll;
    i = i+1;
end

% Perturb kappa_ent
fprintf('\n ----------------------------');
fprintf('\n Perturbing kappa_ent...')
i = 1;
for k = 1.75:0.01:2.75
    grid_3(i) = k;
    x0 = [phi, kappa_inc, k];
    ll = feval(@Likelihood,x0,1);
    %fprintf('\n If kappa_ent = %1.2f, log likelihood = %3.4f', k, ll)
    LL_3(i) = ll;
    i = i+1;
end

% Calculate difference from MLE
LL_0 = -112.8000142728 * ones(101,1);
LL_1gap = LL_0 - LL_1;
LL_2gap = LL_0 - LL_2;
LL_3gap = LL_0 - LL_3;
LL_1plot = [grid_1, LL_1gap];
LL_2plot = [grid_2, LL_2gap];
LL_3plot = [grid_3, LL_3gap];

save('Result_CI.mat', LL_1plot, LL_2plot, LL_3plot);
diary off;
