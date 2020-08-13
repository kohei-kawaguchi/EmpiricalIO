% SOLVING FIRST-ORDER CONDITIONS FOR OUTPUTS (No-Cannibalization Case)
% 8/23/2011 --> 8/29/2011

tic; delete 'FindPi_NoCannibn_Diary'; diary('FindPi_NoCannibn_Diary');
options = optimset('Display','off'); warning off;

load DataWithMC.mat;
global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn Nroo;

% Prepare initial values (recycling q's from FindMC.m
q_actual = q;
q_actual(:,2) = q(:,1); % Avoid 0's (which would bug the FOC calculation)
q_actual(1,4) = q(2,4);
q_actual(:,3) = q_actual(:,4);

% Initialize vehicles for solutions
q = zeros(1,2);
qo = 0; qn = 0;
Qo = 0; Qn = 0; Q0 = 0;
Po = 0; Pn = 0;
pi_o = 0; pi_b = 0; pi_n = 0; pi_roo = 0;
Bigq = zeros(18,2,12,12,15,12);  % (year,qo/qbo/qbn/qn,No,Nb,Nn,Nroo)
BigQ = zeros(18,3,12,12,15,12);  % (year,Q_old/Q_new/Q_0,No,Nb,Nn,Nroo)
BigP = zeros(18,2,12,12,15,12);  % (year,P_old/P_new,state,No,Nb,Nn,Nroo)
BigPi = zeros(18,4,12,12,15,12); % (year,old/both/new,No,Nb,Nn,Nroo)

for t = 1:18
    
    % Time-varying inputs
    Mkt = M(t);                 % Market size
    X_o = X(t,1);               % Old's average quality (log capacity)
    X_n = X(t,2);               % New's average quality (log capacity)
    Xe_o = Xe(t,1);             % Old's popularity
    Xe_n = Xe(t,2);             % New's popularity
    YearDummy = Yd(t);          % Year dummy
    MC_o = MC(t,1);             % Old's marginal cost
    MC_n = MC(t,4);             % New's marginal cost
        
    %q0_base = q_actual(t,:);    % Initial guess = "actual" / 2 (to avoid explosion)
    q0 = [0, 0];
    lb = ones(2,1) * 0.0001;    % q's lower bound (not exactly 0 to avoid explosion)
    ub = ones(2,1) * Mkt;       % q's upper bound 
        
    for No = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for Nroo = 0:11
                
                fprintf('\n');
                fprintf('\n Year %2.0f, State (Nroo, No, Nb, Nn) = (%2.0f, %2.0f, %2.0f, %2.0f)',...
                t,Nroo,No,Nb,Nn);
                
                % Prepare constraints & initial-point fool-proof
                A = [Nroo, (Nb + Nn)]; % (A * q) = (Qo + Qn) <= Mkt
                
                % Solve FOCs
                if Nroo > 0 && (Nb > 0 || Nn > 0); 
                    q = fmincon(@FOC_101,q0,A,Mkt,[],[],lb,ub,@nonlcon_101,options);
                elseif Nroo > 0 && (Nb == 0 && Nn == 0);
                    q = fmincon(@FOC_100,q0,A,Mkt,[],[],lb,ub,@nonlcon_100,options);
                    q(2) = 0;
                elseif Nroo == 0 && (Nb > 0 || Nn > 0);
                    q = fmincon(@FOC_001,q0,A,Mkt,[],[],lb,ub,@nonlcon_001,options);
                    q(1) = 0;
                elseif Nroo == 0 && (Nb == 0 && Nn ==0);
                    q = zeros(1,2);     
                end
                qo = q(1); qn = q(2);
                
                % Derive aggregate variables
                Qo = Nroo * qo;
                Qn = (Nb + Nn) * qn;
                Q0 = Mkt - Qo - Qn;                
                
                if Nroo == 0; Po = 0; else
                Po = (-1/alpha1) * (-log(Qo/Q0) + alpha2 * 0 ...
                    + alpha3 * X_o + Xe_o + YearDummy); end
                if (Nn == 0 && Nb == 0); Pn = 0; else
                Pn = (-1/alpha1) * (-log(Qn/Q0) + alpha2 * 1 ...
                    + alpha3 * X_n + Xe_n + YearDummy); end
            
                pi_o = 0;
                pi_b = (Pn - MC_n) * qn;
                pi_n = (Pn - MC_n) * qn;
                pi_roo = (Po - MC_o) * qo;
                
                % Store final answer: equilibrium (q, Q, P, Pi)
                Bigq(t,1,No+1,Nb+1,Nn+1,Nroo+1) = qo;
                Bigq(t,2,No+1,Nb+1,Nn+1,Nroo+1) = qn;
                
                BigQ(t,1,No+1,Nb+1,Nn+1,Nroo+1) = Qo;
                BigQ(t,2,No+1,Nb+1,Nn+1,Nroo+1) = Qn;
                BigQ(t,3,No+1,Nb+1,Nn+1,Nroo+1) = Q0;
                
                BigP(t,1,No+1,Nb+1,Nn+1,Nroo+1) = Po;
                BigP(t,2,No+1,Nb+1,Nn+1,Nroo+1) = Pn;
                
                BigPi(t,1,No+1,Nb+1,Nn+1,Nroo+1) = pi_o;
                BigPi(t,2,No+1,Nb+1,Nn+1,Nroo+1) = pi_b;
                BigPi(t,3,No+1,Nb+1,Nn+1,Nroo+1) = pi_n;
                BigPi(t,4,No+1,Nb+1,Nn+1,Nroo+1) = pi_roo;
                
                fprintf('\n (qo, qn) = (%4.2f, %4.2f)', qo, qn);
                fprintf('\n (Po, Pn) = (%4.3f, %4.3f)', Po, Pn);            
                fprintf('\n (pi_roo, pi_o, pi_b, pi_n) = (%4.3f, %4.3f, %4.3f, %4.3f)', pi_roo, pi_o, pi_b, pi_n);
                
                end
            end
        end
    end
end

save FindPi_NoCannibn.mat BigP BigPi BigQ Bigq;
toc; diary off;
