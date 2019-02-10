% DATA 8/4/2011

% Demand estimates (IV-Logit, Narrow market definition: 4a)
% From '110726_Stata_Demand' folder > "110728_LogitRegression_4a.smcl" for details.

alpha0 = 2.615908;    % Constant
alpha1 = -3.28454;    % Price coefficient
alpha2 = .909773;     % Generation coeff. (3.5-inch dummy)
alpha3 = 1.204684;     % Quality coeff. (log of capacity grid)

Yd = [.5518000; .4340000; .2516000; .1981123; -.1185236;
    -.3911998; -1.736183; -1.833652; -2.286165; -2.718398;
    -4.170964; -4.284703; -5.348067; -5.653561; -5.109807;
    -8.529835; -9.381498; -10.62025]; % Year dummy
    % 1981-83 (no data) extrapolated with quadratic fit.
    % See '110726_Stata_Demand' > "110805_Extrapolation.xlsx"

% For Xe_old & Xe_new, see "110804_GetXe_4a.do".

Xe_old = [-0.0000000298; -0.0000000298; -0.0000000298; 0.5117696; 0.347387;
    0.1941954; 0.3936177; 0.6313243; 0.3614785; 0.4035313;
    0.4843681; -0.1886643; -0.4034452; -0.4157396; 0.8370401;
    -1.236991; -1.015655; -1.338387]; % 5.25-inch (US + Non-US, OEM + PCM)

Xe_new = [-4.2872480; -4.2872480; -4.2872480; -4.2872480; -3.0421300; 
    -4.7288150; -1.3909210; -1.8816000; -0.7113002; -1.0041580; 
    -0.4059780; 0.1378063; 0.4306508; 0.4135973; -0.2527456; 
    0.5313646; 0.6601855; 1.1307970]; % 3.5-inch (US + Non-US, OEM + PCM)

Xe = [Xe_old, Xe_new]; clear Xe_old Xe_new;

% Data: Market Size - from /110726_Stata_Demand/110804_GetM_1a.csv

M = [50.4; 217.5; 1144.9; 2578.7; 3486.4; 
    6042.8; 10059.6; 14072.4; 18394.3; 22467.1; 
    24855.7; 34207.7; 40455.3; 56638.8; 73831.7; 
    88324; 110206.7; 120885.9]; % Def.1a = Global non-captive & removable

% Data: Shipment quantity - from /110726_Stata_Demand/110805_GetQ_1a.csv

Q_old = [50.4; 214.9; 1123.2; 2468.1; 3071.1;
    4865.8; 7285; 8119.6; 7604.2; 6115.1; 
    2443.2; 1548.9; 795.9; 381.7; 415.3; 
    4565; 5572.8; 4070];

Q_new = [0; 1.5; 1.5; 67.3; 338.6; 
    1107.9; 2707.7; 5898.9; 10691.9; 16200.1; 
    22170.2; 32340.9; 39289.6; 55789.7; 72812.1;
    82718; 103394.7; 115548.2]; % 1982 = 0 in Q data. Copied from 1983.

Q_0 = M - Q_old - Q_new; % Outside goods = removable HDDs.
% Q_0 in 1981 is zero, which will bug the later computation. So quick fix:
Q_old(1) = M(1) * (Q_old(2) / M(2)); % Assume the 1982 share for 1981, too.
Q_0(1) = M(1) - Q_old(1);         

Q = [Q_old, Q_new, Q_0]; clear Q_old Q_new Q_0;

% Data: Price ($000, 1998 constant USD) - 110726_Stata_Demand/110804_GetXe_4a_5inch.csv

    Price_old = [1.4692000; 1.5000000; 1.2420850; 1.5455050; 1.7564360; 
    2.0364920; 1.3937740; 1.3815730; 1.1462210; 1.3333120; 
    1.2193700; 1.0815290; 1.2695770; 1.1822019; 1.1008402; 
    1.0250780; 0.5846152; 0.5608584]; % 5.25-inch (US + Non-US, OEM + PCM)
    % 1981-82 (no data) are extrapolated with quadratic fit,
    % after interpolating 1994-95 (extreme spike probably due to small volume).
    % See '110726_Stata_Demand' > "110805_Extrapolation.xlsx"

Price_new = [0; 0.7594400; 0.6295900; 0.5733650; 0.5215880; 
    0.5436620; 0.4490540; 0.6824285; 0.5440114; 0.6160858; 
    0.6249771; 0.5999736; 0.4906102; 0.4334007; 0.4314563; 
    0.4308811; 0.3689061; 0.2582387]; % 3.5-inch (US + Non-US, OEM + PCM)
    % No firm in 1981, so just put 0.
    % 1982-83 (also no data) are extrapolated with 4th-order polynomial
    % See '110726_Stata_Demand' > "110805_Extrapolation.xlsx"

P = [Price_old, Price_new]; clear Price_old Price_new;

% Data: Average Quality (log of MB)

Quality_old = [3.1595000; 3.2572000; 3.257356; 3.257356; 3.695676; 
    4.379203; 4.379768; 4.761251; 4.761251; 5.037604; 
    5.618322; 5.697090; 6.400625; 6.490788; 7.386377; 
    7.582651; 8.421734; 9.327935]; % 5.25-inch (US + Non-US, OEM + PCM)
    % 1981-82 (no data) are extrapolated with quadratic fit,
    % See '110726_Stata_Demand' > "110805_Extrapolation.xlsx"

Quality_new = [2.708050; 2.708050; 2.708050; 2.708050; 2.708050; 
    3.257356; 3.257356; 3.976844; 3.976844; 4.523101; 
    5.149794; 5.470301; 5.899639; 6.240812; 6.890195; 
    7.494252; 8.096524; 8.568047]; % 3.5-inch (US + Non-US, OEM + PCM)
    % No firm in 1981, so just put 0.
    % 1982-83 (no data) are extrapolated with quadratic fit,
    % See '110726_Stata_Demand' > "110805_Extrapolation.xlsx"

X = [Quality_old, Quality_new]; clear Quality_old Quality_new;

% Industry State = # Firms (of 3 types/states) & Exit/Adopt/Enter decisions.

State =[
    11  0   0   1;   % (N_old, N_both, N_new, N_pe) from t = 1 to T.
    11  0   1   0;
    10  1   1   3;
    5   6   4   4; % N_pe = 3 if "wait/quit" ignored
    4   7   7   2; % N_pe = 1 if "wait/quit" ignored
    4   6   7   2;
    3   7   9   2;
    3   7   10  0;
    3   6   10  0;
    2   5   10  0;
    2   4   8   0; % N_pe = 7 if Plus Development "exited" in 1990.
    2   4   7   0; % N_pe = 6 if Plus Development "exited" in 1990.
    1   4   7   0; % N_pe = 6 if Plus Development "exited" in 1990.
    1   4   5   0; % N_pe = 4 if Plus Development "exited" in 1990.
    1   4   5   0; % N_pe = 3 if Conner Peripheral "exited" in 1994, too.
    1   4   5   0; % N_pe = 3 if Conner Peripheral "exited" in 1994, too.
    1   4   4   0; % N_pe = 2 if Conner Peripheral "exited" in 1994, too.
    0   4   3   0];% N_pe = 1 if Conner Peripheral "exited" in 1994, too.

State2 = [State(:,1) + State(:,2), State(:,2) + State(:,3)]; % # firms by bin. 
        
Exit = [
    0	0	0;    % (X_old, X_both, X_new) from t = 1 to T-1.
    0	0	0;
    0   0   0;
    0   0   0;
    0   1   1;
    0   0   0;
    0   0   1;
    0   1   0;
    1   1   0;
    0   1   2; % X_new = 3 if Plus Development "exited" in 1990.
    0   0   1;
    1   0   0;
    0   0   2;
    0	0	0; % X_new = 1 if Conner Peripheral "exited" in 1994.
    0   0   0;
    0   0   1;
    1   0   1];

Adopt = [
    0	1;      % (A_inc, A_ent) from t = 1 to T-1.
    1   0;
    5   3;
    1   3;
    0   1;
    1   2;
    0   2;
    0	0;
    0	0;
    0	0;
    0	0;
    0	0;
    0	0;
    0	0;
    0	0;
    0	0;
    0	0];

save Data.mat;