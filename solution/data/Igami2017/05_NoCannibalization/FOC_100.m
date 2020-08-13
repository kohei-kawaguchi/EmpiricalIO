function F = FOC_100(q)

% q(1) = q_o
% q(2) = q_n

global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn Nroo;

Qo = Nroo * q(1);
Qn = 0;
Q0 = Mkt - Qo - Qn;

Po = (-1/alpha1) * (-log(Qo/Q0) + alpha2 * 0 + alpha3 * X_o + Xe_o + YearDummy);
Pn = 0;

dPoQo = (Qo + Q0) / (alpha1 * Qo * Q0);
dPnQo = 0;
dPoQn = 0;
dPnQn = 0;

foc_o  = Po + dPoQo * q(1)                - MC_o;

F = foc_o^2;
