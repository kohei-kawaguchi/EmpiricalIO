function F = FOC_101(q)

% q(1) = q_o
% q(2) = q_n

global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn Nroo;

Qo = Nroo * q(1);
Qn = (Nb + Nn) * q(2);
Q0 = Mkt - Qo - Qn;

Po = (-1/alpha1) * (-log(Qo/Q0) + alpha2 * 0 + alpha3 * X_o + Xe_o + YearDummy);
Pn = (-1/alpha1) * (-log(Qn/Q0) + alpha2 * 1 + alpha3 * X_n + Xe_n + YearDummy);

dPoQo = (Qo + Q0) / (alpha1 * Qo * Q0);
dPnQo =         1 / (alpha1 * Q0);
dPoQn =         1 / (alpha1 * Q0);
dPnQn = (Qn + Q0) / (alpha1 * Qn * Q0);

foc_o  = Po + dPoQo * q(1)                - MC_o;
foc_n  = Pn + dPnQn * q(2)                - MC_n;

F = foc_o^2 + foc_n^2;
