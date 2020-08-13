% Dynamic Tech-Adoption Game
% By Mitsuru Igami
% Original = 1/27/2011; Prev version = 8/23/2011; This version = 10/14/2013;

delete 'Diary'; diary('Diary');
global beta delta State Exit Adopt T Pi V iterMLE EV Policy LL;
%load BigProfitMatrix.mat;
load CheckPi.mat;   % Profit (t, type, N_old, N_both, N_new)
                    % = (18 x 3 x 12 x 12 x 15) matrix

% Basic parameters
scaling = 1000;     % Re-scale profits, to avoid explosion due to exp(pi) or exp(EV)
beta = .88;         % Discount factor
delta = .9388;      % Decline in SC (= MC_new's drop rate)
T = size(State,1);  % Number of periods (years)

fprintf('\n  -----------------------------------------');
fprintf('\n | STRATEGIC (RATIONAL-EXPECTATIONS) MODEL |');
fprintf('\n  -----------------------------------------');

fprintf('\n ----- Basic parameters to be "calibrated" -----');
fprintf('\n   Profit/value scaling      :     %4.0f', scaling);
fprintf('\n   Discount factor (beta)    :     %1.4f', beta);
fprintf('\n   Adoption cost drop (delta):     %1.4f', delta);
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

% Maximum Likelihood Estimation of Dynamic Parameters (phi, kappa_inc, kappa_ent)
iterMLE = 1;                    % Starting number of iteration
x0 = [1 1 1];
options = optimset('Display','iter','TolFun',1e-8,'TolX',1e-4,...
    'MaxIter',1000,'MaxFunEvals',1000);

%Theta = fminunc(@Likelihood,x0,options,1);
Theta = fminsearch(@Likelihood,x0,options,1)

% Standard errors of ML estimates
perturb = .001;    % perturbation for computing numerical derivatives
logL = Likelihood(Theta,2); % log likelihood at the point estimate
for k = 1:3
    Theta_perturbed = Theta;
    Theta_perturbed(k) = Theta_perturbed(k) + perturb;    % perturb each parameter
    logL_perturbed = Likelihood(Theta_perturbed,2);   % perturbed logL
    logLderiv(:,k) = (logL_perturbed - logL) / perturb; % derivative of logL
end;
Vhat = inv(logLderiv' * logLderiv);

fprintf('\n ----- Maximum Likelihood Estimation Results for (phi & kappa_inc) -----');
fprintf('\n Coeff.: %8.8f %8.8f %8.8f',Theta); % parameter estimates
fprintf('\n S.E.  : %8.8f %8.8f %8.8f',sqrt(diag(Vhat))); % standard errors
fprintf('\n -----------------------------------------------------------------------');
fprintf('\n');

% Finish
save MLEresults.mat;
diary off;