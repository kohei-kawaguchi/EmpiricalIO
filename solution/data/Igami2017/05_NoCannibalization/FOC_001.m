function F = FOC_001(q)

% q(1) = q_o
% q(2) = q_n

global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn Nroo;

Qo = 0;
Qn = (Nb + Nn) * q(2);
Q0 = Mkt - Qo - Qn;

Po = 0;
Pn = (-1/alpha1) * (-log(Qn/Q0) + alpha2 * 1 + alpha3 * X_n + Xe_n + YearDummy);

dPoQo = 0;
dPnQo = 0;
dPoQn = 0;
dPnQn = (Qn + Q0) / (alpha1 * Qn * Q0);

foc_n  = Pn + dPnQn * q(2)                - MC_n;

F = foc_n^2;
