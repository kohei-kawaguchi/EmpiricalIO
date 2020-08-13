% SOLVING FIRST-ORDER CONDITIONS FOR OUTPUTS
% 8/23/2011

tic; delete 'CheckPi_Diary'; diary('CheckPi_Diary');
load DataWithMC.mat;
load FindPi.mat;

% Bigq = zeros(18,4,12,12,15);  % (year,qo/qbo/qbn/qn,No,Nb,Nn)
% BigQ = zeros(18,3,12,12,15);  % (year,Q_old/Q_new/Q_0,No,Nb,Nn)
% BigP = zeros(18,2,12,12,15);  % (year,P_old/P_new,state,No,Nb,Nn)
% BigPi = zeros(18,3,12,12,15); % (year,old/both/new,No,Nb,Nn)

% Check q, Q, P, & Pi for non-negative & reality
fprintf('\n Checking Bigq (non-negative & real)...\n');
for t = 1:18        
    for No = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for type = 1:4
                    
                    check = Bigq(t,type,No+1,Nb+1,Nn+1);
                    if check < 0
                        fprintf('\n Negative at Year %2.0f, (No,Nb,Nn,type) = (%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,type);
                    end
                    if isreal(check) == 0
                        fprintf('\n Complex at Year %2.0f, (No,Nb,Nn,type) = (%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,type);
                    end
                end
            end
        end
    end
end

fprintf('\n Checking BigQ (non-negative & real)...\n');
for t = 1:18        
    for No = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for type = 1:2
                    
                    check = BigQ(t,type,No+1,Nb+1,Nn+1);
                    if check < 0
                        fprintf('\n Negative at Year %2.0f, (No,Nb,Nn,type) = (%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,type);
                    end
                    if isreal(check) == 0
                        fprintf('\n Complex at Year %2.0f, (No,Nb,Nn,type) = (%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,type);
                    end
                end
            end
        end
    end
end

fprintf('\n Checking BigP (non-negative & real)...\n');
for t = 1:18        
    for No = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for type = 1:2
                    
                    check = BigP(t,type,No+1,Nb+1,Nn+1);
                    if check < 0
                        fprintf('\n Negative at Year %2.0f, (No,Nb,Nn,type) = (%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,type);
                    end
                    if isreal(check) == 0
                        fprintf('\n Complex at Year %2.0f, (No,Nb,Nn,type) = (%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,type);
                    end
                end
            end
        end
    end
end

fprintf('\n Checking BigPi (non-negative & real)...\n');
for t = 1:18        
    for No = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for type = 1:3
                    check = BigPi(t,type,No+1,Nb+1,Nn+1);
                    if check < 0
                        fprintf('\n Negative at Year %2.0f, (No,Nb,Nn,type) = (%2.0f,%2.0f,%2.0f,%1.0f) --> Corrected',...
                        t,No,Nb,Nn,type);
                        BigPi(t,type,No+1,Nb+1,Nn+1) = 0; % Correct negatives to zero
                    end
                    if isreal(check) == 0
                        fprintf('\n Complex at Year %2.0f, (No,Nb,Nn,type) = (%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,type);
                    end
                end
            end
        end
    end
end
Pi = BigPi;                     % rename BigPi as Pi to match the estimation codes
save CheckPi.mat;               
fprintf('\n ### BigPi (now called Pi) saved as CheckPi.mat');
                    
% Check monotonicity in N
fprintf('\n\n Checking qo (monotonicity in No)...');
count = 0;
for t = 1:18        
    for Nb = 0:11
        for Nn = 0:14
            No = 1;
            q_prev = Bigq(t,1,No+1,Nb+1,Nn+1);
            for No = 2:11
                q = Bigq(t,1,No+1,Nb+1,Nn+1);
                if q > q_prev;
%                    fprintf('\n qo rose at Year %2.0f, (No,Nb,Nn) = (%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn);
                    count = count + 1;
                end;
                q_prev = q;
            end
        end
    end
end
fprintf('\n qo rose %2.0f times (out of total 32,400)',count);

fprintf('\n\n Checking qbo (monotonicity in Nb)...');
count = 0;
for t = 1:18        
    for No = 0:11
        for Nn = 0:11
            Nb = 1;
            q_prev = Bigq(t,2,No+1,Nb+1,Nn+1);
            for Nb = 2:11
                q = Bigq(t,2,No+1,Nb+1,Nn+1);
                if q > q_prev;
%                    fprintf('\n qbo rose at Year %2.0f, (No,Nb,Nn) = (%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn);
                    count = count + 1;
                end;
                q_prev = q;
            end
        end
    end
end
fprintf('\n qbo rose %2.0f times (out of total 32,400)',count);

fprintf('\n\n Checking qbn (monotonicity in Nb)...');
count = 0;
for t = 1:18        
    for No = 0:11
        for Nn = 0:11
            Nb = 1;
            q_prev = Bigq(t,3,No+1,Nb+1,Nn+1);
            for Nb = 2:11
                q = Bigq(t,3,No+1,Nb+1,Nn+1);
                if q > q_prev;
%                    fprintf('\n qbn rose at Year %2.0f, (No,Nb,Nn) = (%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn);
                    count = count + 1;
                end;
                q_prev = q;
            end
        end
    end
end
fprintf('\n qbn rose %2.0f times (out of total 32,400)',count);

fprintf('\n\n Checking qn (monotonicity in Nn)...');
count = 0;
for t = 1:18        
    for No = 0:11
        for Nb = 0:11
            Nn = 1;
            q_prev = Bigq(t,4,No+1,Nb+1,Nn+1);
            for Nn = 2:11
                q = Bigq(t,4,No+1,Nb+1,Nn+1);
                if q > q_prev;
%                    fprintf('\n qn rose at Year %2.0f, (No,Nb,Nn) = (%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn);
                    count = count + 1;
                end;
                q_prev = q;
            end
        end
    end
end
fprintf('\n qn rose %2.0f times (out of total 33,696)',count);

fprintf('\n\n Checking Pi_o (monotonicity in No)...');
count = 0;
for t = 1:18        
    for Nb = 0:11
        for Nn = 0:14
            No = 1;
            pi_prev = BigPi(t,1,No+1,Nb+1,Nn+1);
            for No = 2:11
                pi = BigPi(t,1,No+1,Nb+1,Nn+1);
                if pi > pi_prev;
%                    fprintf('\n Pi_o rose at Year %2.0f, (No,Nb,Nn) = (%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn);
                    count = count + 1;
                end;
                pi_prev = pi;
            end
        end
    end
end
fprintf('\n Pi_o rose %2.0f times (out of total 32,400)',count);

fprintf('\n\n Checking Pi_b (monotonicity in Nb)...');
count = 0;
for t = 1:18        
    for No = 0:11
        for Nn = 0:11
            Nb = 1;
            pi_prev = BigPi(t,2,No+1,Nb+1,Nn+1);
            for Nb = 2:11
                pi = BigPi(t,2,No+1,Nb+1,Nn+1);
                if pi > pi_prev;
%                    fprintf('\n Pi_b rose at Year %2.0f, (No,Nb,Nn) = (%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn);
                    count = count + 1;
                end;
                pi_prev = pi;
            end
        end
    end
end
fprintf('\n Pi_b rose %2.0f times (out of total 32,400)',count);

fprintf('\n\n Checking Pi_n (monotonicity in Nn)...');
count = 0;
for t = 1:18        
    for No = 0:11
        for Nb = 0:11
            Nn = 1;
            pi_prev = BigPi(t,3,No+1,Nb+1,Nn+1);
            for Nn = 2:11
                pi = BigPi(t,3,No+1,Nb+1,Nn+1);
                if pi > pi_prev;
%                    fprintf('\n Pi_n rose at Year %2.0f, (No,Nb,Nn) = (%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn);
                    count = count + 1;
                end;
                pi_prev = pi;
            end
        end
    end
end
fprintf('\n Pi_n rose %2.0f times (out of total 33,696)',count);


fprintf('\n Done \n');
toc; diary off;
