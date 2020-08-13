% SOLVING FIRST-ORDER CONDITIONS FOR OUTPUTS
% 8/23/2011

tic; delete 'CheckPi_NoCannibn_Diary'; diary('CheckPi_NoCannibn_Diary');
load DataWithMC.mat;
load FindPi_NoCannibn.mat;

% Check q, Q, P, & Pi for non-negative & reality
fprintf('\n Checking Bigq (non-negative & real)...\n');
for t = 1:18        
    No = 0;
    for Nroo = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for type = 1:2
                    
                    check = Bigq(t,type,No+1,Nb+1,Nn+1,Nroo+1);
                    if check < 0
                        fprintf('\n Negative at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,Nroo,type);
                    end
                    if isreal(check) == 0
                        fprintf('\n Complex at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,Nroo,type);
                    end
                    if isnan(check) == 1
                        fprintf('\n NaN at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,Nroo,type);
                    end
                end
            end
        end
    end
end

fprintf('\n Checking BigQ (non-negative & real)...\n');
for t = 1:18        
    No = 0;
    for Nroo = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for type = 1:2
                    
                    check = BigQ(t,type,No+1,Nb+1,Nn+1,Nroo+1);
                    if check < 0
                        fprintf('\n Negative at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,Nroo,type);
                    end
                    if isreal(check) == 0
                        fprintf('\n Complex at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,Nroo,type);
                    end
                end
            end
        end
    end
end

fprintf('\n Checking BigP (non-negative & real)...\n');
for t = 1:18        
    No = 0;
    for Nroo = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for type = 1:2
                    
                    check = BigP(t,type,No+1,Nb+1,Nn+1,Nroo+1);
                    if check < 0
                        fprintf('\n Negative at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,Nroo,type);
                    end
                    if isreal(check) == 0
                        fprintf('\n Complex at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,Nroo,type);
                    end
                end
            end
        end
    end
end

fprintf('\n Checking BigPi (non-negative & real)...\n');
for t = 1:18             
    No = 0;
    for Nroo = 0:11
        for Nb = 0:11
            for Nn = 0:14
                for type = 1:3
                    check = BigPi(t,type,No+1,Nb+1,Nn+1,Nroo+1);
                    if check < 0
                        fprintf('\n Negative at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f) --> Corrected',...
                        t,No,Nb,Nn,Nroo,type);
                        BigPi(t,type,No+1,Nb+1,Nn+1,Nroo+1) = 0; % Correct negatives to zero
                    end
                    if isreal(check) == 0
                        fprintf('\n Complex at Year %2.0f, (No,Nb,Nn,Nroo,type) = (%2.0f,%2.0f,%2.0f,%2.0f,%1.0f)',...
                        t,No,Nb,Nn,Nroo,type);
                    end
                end
            end
        end
    end
end

Pi = BigPi;                     % rename BigPi as Pi to match the estimation codes
save CheckPi_NoCannibn.mat;               
fprintf('\n ### BigPi (now called Pi) saved as CheckPi_NoCannibn.mat');
                    
% Check monotonicity in N
fprintf('\n\n Checking qo (monotonicity in Nroo)...');
count = 0;
for t = 1:18        
    No = 0;
    for Nb = 0:11
        for Nn = 0:14
            Nroo = 1;
            q_prev = Bigq(t,1,No+1,Nb+1,Nn+1);
            for Nroo = 2:11
                q = Bigq(t,1,No+1,Nb+1,Nn+1);
                if q > q_prev;
%                    fprintf('\n qo rose at Year %2.0f, (No,Nb,Nn,Nroo) = (%2.0f,%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn,Nroo);
                    count = count + 1;
                end;
                q_prev = q;
            end
        end
    end
end
fprintf('\n qo rose %2.0f times (out of total 32,400)',count);

fprintf('\n\n Checking qbn (monotonicity in Nb)...');
count = 0;
for t = 1:18     
    No = 0;
    for Nroo = 0:11
        for Nn = 0:11
            Nb = 1;
            q_prev = Bigq(t,2,No+1,Nb+1,Nn+1,Nroo+1);
            for Nb = 2:11
                q = Bigq(t,2,No+1,Nb+1,Nn+1,Nroo+1);
                if q > q_prev;
%                    fprintf('\n qbo rose at Year %2.0f, (No,Nb,Nn,Nroo) = (%2.0f,%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn,Nroo);
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
    No = 0;
    for Nroo = 0:11
        for Nb = 0:11
            Nn = 1;
            q_prev = Bigq(t,2,No+1,Nb+1,Nn+1,Nroo+1);
            for Nn = 2:11
                q = Bigq(t,2,No+1,Nb+1,Nn+1,Nroo+1);
                if q > q_prev;
%                    fprintf('\n qn rose at Year %2.0f, (No,Nb,Nn,Nroo) = (%2.0f,%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn,Nroo);
                    count = count + 1;
                end;
                q_prev = q;
            end
        end
    end
end
fprintf('\n qn rose %2.0f times (out of total 33,696)',count);

fprintf('\n\n Checking Pi_roo (monotonicity in Nroo)...');
count = 0;
for t = 1:18        
    No = 0;
    for Nb = 0:11
        for Nn = 0:14
            Nroo = 1;
            pi_prev = BigPi(t,4,No+1,Nb+1,Nn+1,Nroo+1);
            for Nroo = 2:11
                pi = BigPi(t,1,No+1,Nb+1,Nn+1,Nroo+1);
                if pi > pi_prev;
%                    fprintf('\n Pi_roo rose at Year %2.0f, (No,Nb,Nn,Nroo) = (%2.0f,%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn,Nroo);
                    count = count + 1;
                end;
                pi_prev = pi;
            end
        end
    end
end
fprintf('\n Pi_roo rose %2.0f times (out of total 32,400)',count);

fprintf('\n\n Checking Pi_b (monotonicity in Nb)...');
count = 0;
for t = 1:18      
    No = 0;
    for Nroo = 0:11
        for Nn = 0:11
            Nb = 1;
            pi_prev = BigPi(t,2,No+1,Nb+1,Nn+1,Nroo+1);
            for Nb = 2:11
                pi = BigPi(t,2,No+1,Nb+1,Nn+1,Nroo+1);
                if pi > pi_prev;
%                    fprintf('\n Pi_b rose at Year %2.0f, (No,Nb,Nn,Nroo) = (%2.0f,%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn,Nroo);
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
    No = 0;
    for Nroo = 0:11
        for Nb = 0:11
            Nn = 1;
            pi_prev = BigPi(t,3,No+1,Nb+1,Nn+1,Nroo+1);
            for Nn = 2:11
                pi = BigPi(t,3,No+1,Nb+1,Nn+1,Nroo+1);
                if pi > pi_prev;
%                    fprintf('\n Pi_n rose at Year %2.0f, (No,Nb,Nn,Nroo) = (%2.0f,%2.0f,%2.0f,%2.0f))',...
%                        t,No,Nb,Nn,Nroo);
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
