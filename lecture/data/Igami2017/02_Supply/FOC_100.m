function F = FOC_100(q)

% q(1) = q_o
% q(2) = q_bo
% q(3) = q_bn
% q(4) = q_n

global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn;

Qo = No * q(1) + Nb * 0;
Qn = Nb * 0    + Nn * 0;
Q0 = Mkt - Qo - Qn;

Po = (-1/alpha1) * (-log(Qo/Q0) + alpha2 * 0 + alpha3 * X_o + Xe_o + YearDummy);
Pn = 0;

dPoQo = (Qo + Q0) / (alpha1 * Qo * Q0);
dPnQo = 0;
dPoQn = 0;
dPnQn = 0;

foc_o  = Po + dPoQo * q(1)                - MC_o;
foc_bo = q(2);
foc_bn = q(3);
foc_n  = q(4);

F = foc_o^2 + foc_bo^2 + foc_bn^2 + foc_n^2;
%F = [foc_o; foc_bo; foc_bn; foc_n];
