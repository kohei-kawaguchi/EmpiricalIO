function [c,ceq] = nonlcon_101(q)

global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn Nroo;

% Inequality constraints (i): Prices must be nonnegative
Qo = Nroo * q(1);
Qn = (Nb + Nn) * q(2);
Q0 = Mkt - Qo - Qn;
Po = (-1/alpha1) * (-log(Qo/Q0) + alpha2 * 0 + alpha3 * X_o + Xe_o + YearDummy);
Pn = (-1/alpha1) * (-log(Qn/Q0) + alpha2 * 1 + alpha3 * X_n + Xe_n + YearDummy);
c1 = [-(Po - MC_o); -(Pn - MC_n)];

% Inequality constraint (iii): Q0 > 0
c3 = - (Q0 - 0.0001);

% Total constraints
c = [c1; c3];
ceq = [];
