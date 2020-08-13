% SOLVING FIRST-ORDER CONDITIONS FOR OUTPUTS
% 8/23/2011

tic; delete 'FindPi_Diary'; diary('FindPi_Diary');
options = optimset('Display','off'); warning off;

load DataWithMC.mat;
global alpha1 alpha2 alpha3 Mkt X_o X_n Xe_o Xe_n YearDummy MC_o MC_n No Nb Nn;

% Prepare initial values (recycling q's from FindMC.m
q_actual = q;
q_actual(:,2) = q(:,1); % Avoid 0's (which would bug the FOC calculation)
q_actual(1,4) = q(2,4);
q_actual(:,3) = q_actual(:,4);

% Initialize vehicles for solutions
q = zeros(1,4);
qo = 0; qbo= 0; qbn= 0; qn = 0;
Qo = 0; Qn = 0; Q0 = 0;
Po = 0; Pn = 0;
pi_o = 0; pi_b = 0; pi_n = 0;
Bigq = zeros(18,4,12,12,15);  % (year,qo/qbo/qbn/qn,No,Nb,Nn)
BigQ = zeros(18,3,12,12,15);  % (year,Q_old/Q_new/Q_0,No,Nb,Nn)
BigP = zeros(18,2,12,12,15);  % (year,P_old/P_new,state,No,Nb,Nn)
BigPi = zeros(18,3,12,12,15); % (year,old/both/new,No,Nb,Nn)

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
        
    q0_base = q_actual(t,:);    % Initial guess = "actual" / 2 (to avoid explosion)
    q0 = [0.1, 0.1, 0.1, 0.1];
    lb = ones(4,1) * 0.0001;    % q's lower bound (not exactly 0 to avoid explosion)
    ub = ones(4,1) * Mkt;       % q's upper bound 
        
    for No = 0:11
        for Nb = 0:11
            for Nn = 0:14
                
                fprintf('\n');
                fprintf('\n Year %2.0f, State (No, Nb, Nn) = (%2.0f, %2.0f, %2.0f)',...
                t,No,Nb,Nn);
                
                % Prepare constraints & initial-point fool-proof
                A = [No, Nb, Nb, Nn]; % (A * q) = (Qo + Qn) <= Mkt
                               
                % Sometimes, fmincon is stuck --> Use different q0.
                if t >= 15
                     q0 = q0_base / 2;
                     while A * q0' > Mkt; q0 = q0 / 2; end
                     if No == 0; q0(1) = 0.0001; end
                     if Nb == 0; q0(2) = 0.0001; q0(3) = 0.0001; end
                     if Nn == 0; q0(4) = 0.0001; end
                     if (No >= 8 && Nn ==0) || (No >= 11 && Nn ==1)...
                       || (No == 0 && Nb == 10 && Nn == 8)...
                       || (No == 10 && Nb == 4 && Nn == 2)...
                       || (No == 11 && Nb == 2 && Nn == 2);
                     %if (No >= 8 && Nb >= 4 && Nn ==0); %q0 = [82.49, 25.21, 11433.42, 0.00]; end;
                         q0 = [0.0001, 0.0001, 0.0001, 0.0001]; end;
                end
                    %q0 = [0.1, 0.1, 0.1, 0.1];
                %if (t == 5 && No == 0)
                %if (t == 5 && No == 0 && Nb == 0)
                %|| (t == 5 && No == 0 && Nb == 5 && Nn == 14)                    
                %if (t == 15 && No == 0 && Nb == 5 && Nn == 13)
                %    q0 = [0.00, 2814.82, 1579.29, 3672.50];
                %elseif (t == 15 && No == 1 && Nb == 5 && Nn == 10) 
                %    q0 = [2248.46, 1993.91, 2228.92, 4773.58];
                %elseif (t == 15 && No == 4 && Nb == 0 && Nn == 14) 
                %    q0 = [2164.50, 0.00, 0.00, 4482.98];
                %end
                
                % Solve FOCs
                if No > 0 && Nb > 0 && Nn > 0; 
                    q = fmincon(@FOC,q0,A,Mkt,[],[],lb,ub,@nonlcon,options);
                elseif No > 0 && Nb > 0 && Nn == 0; 
                    q = fmincon(@FOC_110,q0,A,Mkt,[],[],lb,ub,@nonlcon_110,options);
                elseif No > 0 && Nb == 0 && Nn >0;
                    q = fmincon(@FOC_101,q0,A,Mkt,[],[],lb,ub,@nonlcon_101,options);
                elseif No > 0 && Nb == 0 && Nn == 0;
                    q = fmincon(@FOC_100,q0,A,Mkt,[],[],lb,ub,@nonlcon_100,options);
                elseif No == 0 && Nb > 0 && Nn > 0;
                    q = fmincon(@FOC_011,q0,A,Mkt,[],[],lb,ub,@nonlcon_011,options);
                elseif No == 0 && Nb > 0 && Nn == 0;
                    q = fmincon(@FOC_010,q0,A,Mkt,[],[],lb,ub,@nonlcon_010,options);
                elseif No == 0 && Nb == 0 && Nn > 0;
                    q = fmincon(@FOC_001,q0,A,Mkt,[],[],lb,ub,@nonlcon_001,options);
                elseif No == 0 && Nb == 0 && Nn ==0;
                    q = zeros(1,4);     
                end
                qo = q(1); qbo= q(2); qbn= q(3); qn = q(4);
                
                % Derive aggregate variables
                Qo = No * qo + Nb * qbo;
                Qn = Nn * qn + Nb * qbn;
                Q0 = Mkt - Qo - Qn;                
                
                if No == 0 && Nb == 0; Po = 0; else
                Po = (-1/alpha1) * (-log(Qo/Q0) + alpha2 * 0 ...
                    + alpha3 * X_o + Xe_o + YearDummy); end
                if Nn == 0 && Nb == 0; Pn = 0; else
                Pn = (-1/alpha1) * (-log(Qn/Q0) + alpha2 * 1 ...
                    + alpha3 * X_n + Xe_n + YearDummy); end
            
                pi_o = (Po - MC_o) * qo;
                pi_b = (Po - MC_o) * qbo + (Pn - MC_n) * qbn;
                pi_n = (Pn - MC_n) * qn;
                
                % Store final answer: equilibrium (q, Q, P, Pi)
                Bigq(t,1,No+1,Nb+1,Nn+1) = qo;
                Bigq(t,2,No+1,Nb+1,Nn+1) = qbo;
                Bigq(t,3,No+1,Nb+1,Nn+1) = qbn;
                Bigq(t,4,No+1,Nb+1,Nn+1) = qn;
                
                BigQ(t,1,No+1,Nb+1,Nn+1) = Qo;
                BigQ(t,2,No+1,Nb+1,Nn+1) = Qn;
                BigQ(t,3,No+1,Nb+1,Nn+1) = Q0;
                
                BigP(t,1,No+1,Nb+1,Nn+1) = Po;
                BigP(t,2,No+1,Nb+1,Nn+1) = Pn;
                
                BigPi(t,1,No+1,Nb+1,Nn+1) = pi_o;
                BigPi(t,2,No+1,Nb+1,Nn+1) = pi_b;
                BigPi(t,3,No+1,Nb+1,Nn+1) = pi_n;
                
                fprintf('\n (qo, qbo, qbn, qn) = (%4.2f, %4.2f, %4.2f, %4.2f)', qo, qbo, qbn, qn);
                fprintf('\n (Po, Pn) = (%4.3f, %4.3f)', Po, Pn);            
                fprintf('\n (pi_o, pi_b, pi_n) = (%4.3f, %4.3f, %4.3f)', pi_o, pi_b, pi_n);
                
            end
        end
    end
end

save FindPi.mat BigP BigPi BigQ Bigq;
toc; diary off;
