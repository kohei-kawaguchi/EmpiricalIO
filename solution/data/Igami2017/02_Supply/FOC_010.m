function F = FOC_010(q)

% q(1) = q_o
% q(2) = q_bo
% q(3) = q_bn
% q(4) = q_n

global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn;

Qo = No * 0    + Nb * q(2);
Qn = Nb * q(3) + Nn * 0;
Q0 = Mkt - Qo - Qn;

Po = (-1/alpha1) * (-log(Qo/Q0) + alpha2 * 0 + alpha3 * X_o + Xe_o + YearDummy);
Pn = (-1/alpha1) * (-log(Qn/Q0) + alpha2 * 1 + alpha3 * X_n + Xe_n + YearDummy);

dPoQo = (Qo + Q0) / (alpha1 * Qo * Q0);
dPnQo =         1 / (alpha1 * Q0);
dPoQn =         1 / (alpha1 * Q0);
dPnQn = (Qn + Q0) / (alpha1 * Qn * Q0);

foc_o  = q(1);
foc_bo = Po + dPoQo * q(2) + dPnQo * q(3) - MC_o;
foc_bn = Pn + dPnQn * q(3) + dPoQn * q(2) - MC_n;
foc_n  = q(4);

F = foc_o^2 + foc_bo^2 + foc_bn^2 + foc_n^2;
%F = [foc_o; foc_bo; foc_bn; foc_n];
