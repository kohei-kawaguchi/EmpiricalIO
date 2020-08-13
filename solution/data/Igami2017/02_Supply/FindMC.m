% FINDING MARGINAL COSTS USING FOC
% 8/8/2011

load Data.mat;

% Initialize the answer vehicles
dPdQ     = zeros(18,4);  % Price derivatives: [dPoQo, dPnQn, dPnQo, dPoQn]
ePQ      = zeros(18,4);  % Quantity-elas. of price: [ePoQo, ePnQn, ePnQo, ePoQn]
ABCDEFGH = zeros (18,8); % Short-hands for coefficient (see 8/3/2011 memo)
q        = zeros(18,4);  % Equilibrium shipment: [qo, qbo, qbn, qn]
MC       = zeros(18,4);  % Marginal costs: [MCo, MCbo, MCbn, MCn]

for t = 3:18
    
    % Basic data
    No = State(t,1); Nb = State(t,2); Nn = State(t,3);
    m  = M(t);
    Qo = Q(t,1); Qn = Q(t,2); Q0 = Q(t,3);
    Po = P(t,1); Pn = P(t,2);
    so = Qo/m; sn = Qn/m; s0 = Q0/m;
    
    % Price derivatives (from Aug-2 memo, page #6)
    dPoQo = 1 / (alpha1 * Qo);
    dPnQn = 1 / (alpha1 * Qn);
    %dPoQo = (Qo + Q0) / (alpha1 * Qo * Q0);
    %dPnQn = (Qn + Q0) / (alpha1 * Qn * Q0);
    dPnQo = 1 / (alpha1 * Q0);
    dPoQn = 1 / (alpha1 * Q0);
    dPdQ(t,:) = [dPoQo, dPnQn, dPnQo, dPoQn];
    
    % Quantity-elasticity of price
    ePoQo = -dPoQo * (Qo / Po);
    ePnQn = -dPnQn * (Qn / Pn);
    ePnQo = -dPnQo * (Qo / Pn);
    ePoQn = -dPoQn * (Qn / Po);
    ePQ(t,:) = [ePoQo, ePnQn, ePnQo, ePoQn];
    
    % Shor-hands for coefficients (from Aug-3 memo, page #1-2)
    A = dPnQn * (Qn / Nb);
    B = dPoQn * (Qo / Nb);
    C = dPoQn * (No / Nb);
    D = dPnQn * (1 + Nn / Nb);
    E = dPoQn * (Qo / Nb);
    F = dPnQo * (Qn / Nb);
    G = dPnQo * (Nn / Nb);
    H = dPoQo * (1 + No / Nb);
    ABCDEFGH(t,:) = [A B C D E F G H];
    
    % Equilibrium outputs 
    qo  = Qo / (No + Nb);
    qn  = Qn / (Nn + Nb);
    %qo  = (E + F - G*((A+B)/D)) / (H - G*(C/D));
    %qn  = (A + B - C*((E+F)/H)) / (D - C*(G/H));
    qbo = Qo / Nb - (No / Nb) * qo;
    qbn = Qn / Nb - (Nn / Nb) * qn;
    q(t,:) = [qo, qbo, qbn, qn];
    
    % Marginal costs
    MCo  = Po + dPoQo * qo;
    MCn  = Pn + dPnQn * qn;
    MCbo = Po + dPoQo * qbo + dPnQo * qbn;
    MCbn = Pn + dPnQn * qbn + dPoQn * qbo;
    MC(t,:) = [MCo, MCbo, MCbn, MCn];
    
end

for t = 2:2     % In 1982, Nb = 0 !
    
    % Basic data
    No = State(t,1); Nb = State(t,2); Nn = State(t,3);
    m  = M(t);
    Qo = Q(t,1); Qn = Q(t,2); Q0 = Q(t,3);
    Po = P(t,1); Pn = P(t,2);
    so = Qo/m; sn = Qn/m; s0 = Q0/m;
    
    % Price derivatives (from Aug-2 memo, page #6)
    dPoQo = 1 / (alpha1 * Qo);
    dPnQn = 1 / (alpha1 * Qn);
    %dPoQo = (Qo + Q0) / (alpha1 * Qo * Q0);
    %dPnQn = (Qn + Q0) / (alpha1 * Qn * Q0);
    dPnQo = 1 / (alpha1 * Q0);
    dPoQn = 1 / (alpha1 * Q0);
    dPdQ(t,:) = [dPoQo, dPnQn, dPnQo, dPoQn];
    
    % Quantity-elasticity of price
    ePoQo = -dPoQo * (Qo / Po);
    ePnQn = -dPnQn * (Qn / Pn);
    ePnQo = -dPnQo * (Qo / Pn);
    ePoQn = -dPoQn * (Qn / Po);
    ePQ(t,:) = [ePoQo, ePnQn, ePnQo, ePoQn];
    
    % Equilibrium outputs 
    qo  = Qo / No;                  % AUTOMATICALLY !
    qn  = Qn / Nn;                  % AUTOMATICALLY !
    q(t,:) = [qo, 0, 0, qn];
    
    % Marginal costs
    MCo  = Po + dPoQo * qo;
    MCn  = Pn + dPnQn * qn;
    MC(t,:) = [MCo, 0, 0, MCn];
    
end

for t = 1:1     % In 1981, Qn = 0, Nb = 0, and Nn = 0 !
    
    % Basic data
    No = State(t,1); Nb = State(t,2); Nn = State(t,3);
    m  = M(t);
    Qo = Q(t,1); Qn = Q(t,2); Q0 = Q(t,3);
    Po = P(t,1); Pn = P(t,2);
    so = Qo/m; sn = Qn/m; s0 = Q0/m;
    
    % Price derivatives (from Aug-2 memo, page #6)
    dPoQo = 1 / (alpha1 * Qo);
    dPnQn = 1 / (alpha1 * Qn);
    %dPoQo = (Qo + Q0) / (alpha1 * Qo * Q0);
    %dPnQn = (Qn + Q0) / (alpha1 * Qn * Q0);
    dPnQo = 1 / (alpha1 * Q0);
    dPoQn = 1 / (alpha1 * Q0);
    dPdQ(t,:) = [dPoQo, 0, dPnQo, dPoQn];   % IGNORE Inf !
    
    % Quantity-elasticity of price
    ePoQo = -dPoQo * (Qo / Po);
    ePQ(t,:) = [ePoQo, 0, 0, 0];    % IGNORE non-existent products !
    
    % Equilibrium outputs 
    qo  = Qo / No;                  % AUTOMATICALLY !
    q(t,:) = [qo, 0, 0, 0];         % IGNORE non-existent players' outputs
    
    % Marginal costs
    MCo  = Po + dPoQo * qo;
    MC(t,:) = [MCo, 0, 0, 0];       % IGNORE non-existent players
    
end

clear No Nb Nn m Qo Qn Q0 Po Pn so sn s0 dPoQo dPnQn dPnQo dPoQn ...
    ePoQo ePnQn ePnQo ePoQn A B C D E F G H qo qn qbo qbn MCo MCn MCbo MCbn;

save DataWithMC.mat;
