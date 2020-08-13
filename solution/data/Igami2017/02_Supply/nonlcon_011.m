function [c,ceq] = nonlcon_011(q)

global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn;

% Inequality constraints (i): Prices must be nonnegative
Qo = No * 0    + Nb * q(2);
Qn = Nb * q(3) + Nn * q(4);
Q0 = Mkt - Qo - Qn;
Po = (-1/alpha1) * (-log(Qo/Q0) + alpha2 * 0 + alpha3 * X_o + Xe_o + YearDummy);
Pn = (-1/alpha1) * (-log(Qn/Q0) + alpha2 * 1 + alpha3 * X_n + Xe_n + YearDummy);
c1 = [-(Po - MC_o); -(Pn - MC_n)];

% Inequality constraints (ii): qo > qbo, qn > qbn
c2 = q(3) - q(4);

% Inequality constraint (iii): Q0 > 0
c3 = - (Q0 - 0.0001);

% Inequality constraint (iv): q > 0
%c4 = [-(Qo - 0.0001); -(Qn - 0.0001)];
%c4 = [-(q(2) - 0.0001); -(q(3) - 0.0001); -(q(4) - 0.0001)];

% Total constraints
c = [c1; c2; c3];
%c = [c1; c2; c3; c4];
ceq = [];
