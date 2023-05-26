%% All constant
% First, run "Setup()" in command window

% Get parameter values
par = all_constant();

% Run model
[MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);

% Calculate conduction velocity between node 15 and 35
CV_constant = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);

% Get action potential across node 20, 25, and 30
AP_constant = MEMBRANE_POTENTIAL(:,15:35);


%% Variable periaxonal space width
% First, run "Setup()" in command window

mean = 6.477;
sd = 1; % literature value for SD
% sd = 1.94 % CV = 0.3 % coefVar derived SD

% coefVar = 0.1; % common coefVar for all simulations
% sd = round(mean * coefVar, 3); % calc SD from coefVar for different sizes of variation

% Number of simulations:
nSim = 10;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

% The for-loop will be used to calculate the conduction velocity (CV_peri)
% between node 15 and 35, and the voltage trace of node 20,25,30 (AP_peri).
CV_peri = zeros(1,nSim);
AP_peri = cell(nSim, 1);

for i = 1:nSim
    
    % Get parameter values
    par = PeriaxonalSpaceWidth_var(mean, sd, seeds(i));
    
    % Run model
    [MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);
    
    % Calculate conduction velocity between node 15 and 35
    CV_peri(i) = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);
    
    % Get action potential across node 20, 25, and 30
    AP_peri{i} = MEMBRANE_POTENTIAL(:,15:35);
end

if exist('coefVar', 'var') == 1
    save(strcat('Results\CoefVar\AP_peri_CoefVar', string(coefVar),'_SD', string(sd),'.mat'), 'AP_peri');
    save(strcat('Results\CoefVar\CV_peri_CoefVar', string(coefVar),'_SD', string(sd),'.mat'), 'CV_peri');
elseif exist('coefVar', 'var') == 0
    save(strcat('Results\literatureSD\AP_peri_literature_SD', string(sd),'.mat'), 'AP_peri');
    save(strcat('Results\literatureSD\CV_peri_literature_SD', string(sd),'.mat'), 'CV_peri');
end

%% Variable internode length
% First, run "Setup()" in command window

mean = 50.32;
sd = 5; % literature value for SD
% sd = 15.096; % CV = 0.3 % coefVar derived SD

% coefVar is defined before the first block
% sd = round(mean * coefVar, 3); % calc SD from coefVar for different sizes of variation

% nSim is defined in first block
% Number of simulations:
% nSim = 10;

% Seeds is defined in first block
% Seeds: each simulation requires a different seed
% seeds = 1:nSim;

% The for-loop will be used to calculate the conduction velocity (CV_inode)
% between node 15 and 35, and the voltage trace of node 20,25,30 (AP_inode).
CV_inode = zeros(1,nSim);
AP_inode = cell(nSim, 1);

for i = 1:nSim
    
    % Get parameter values
    par = InternodeLength_var(mean, sd, seeds(i));
    
    % Run model
    [MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);
    
    % Calculate conduction velocity between node 15 and 35
    CV_inode(i) = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);
    
    % Get action potential across node 20, 25, and 30
    AP_inode{i} = MEMBRANE_POTENTIAL(:,15:35);
end

if exist('coefVar', 'var') == 1
    save(strcat('Results\CoefVar\AP_inode_CoefVar', string(coefVar),'_SD', string(sd),'.mat'), 'AP_inode');
    save(strcat('Results\CoefVar\CV_inode_CoefVar', string(coefVar),'_SD', string(sd),'.mat'), 'CV_inode');
elseif exist('coefVar', 'var') == 0
    save(strcat('Results\literatureSD\AP_inode_literature_SD', string(sd),'.mat'), 'AP_inode');
    save(strcat('Results\literatureSD\CV_inode_literature_SD', string(sd),'.mat'), 'CV_inode');
end

%% Variable myelin thickness
% First, run "Setup()" in command window

mean = 0.11;
% sd = 0.04; % literature value for SD
% sd = 0.033; % CV = 0.3 % coefVar derived SD

% coefVar is defined before the first block% 
sd = round(mean * coefVar, 3); % calc SD from coefVar for different sizes of variation

% nSim is defined in first block
% Number of simulations:
% nSim = 10;

% Seeds is defined in first block
% Seeds: each simulation requires a different seed
% seeds = 1:nSim;

% The for-loop will be used to calculate the conduction velocity (CV_myelin)
% between node 15 and 35, and the voltage trace of node 20,25,30 (AP_myelin).
CV_myelin = zeros(1,nSim);
AP_myelin = cell(nSim, 1);

for i = 1:nSim
    
    % Get parameter values
    par = MyelinThickness_var(mean, sd, seeds(i));
    
    % Run model
    [MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);
    
    % Calculate conduction velocity between node 15 and 35
    CV_myelin(i) = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);
    
    % Get action potential across node 20, 25, and 30
    AP_myelin{i} = MEMBRANE_POTENTIAL(:,15:35);
end

if exist('coefVar', 'var') == 1
    save(strcat('Results\CoefVar\AP_myelin_CoefVar', string(coefVar),'_SD', string(sd),'.mat'), 'AP_myelin');
    save(strcat('Results\CoefVar\CV_myelin_CoefVar', string(coefVar),'_SD', string(sd),'.mat'), 'CV_myelin');
elseif exist('coefVar', 'var') == 0
    save(strcat('Results\literatureSD\AP_myelin_literature_SD', string(sd),'.mat'), 'AP_myelin');
    save(strcat('Results\literatureSD\CV_myelin_literature_SD', string(sd),'.mat'), 'CV_myelin');
end

%% All variable
% First, run "Setup()" in command window

mean = [50.32, 0.11, 6.477];
% sd = [5, 0.04, 1]; % literature values for SD
% sd = [15.096, 0.033, 1.94]; % CV = 0.3 % coefVar derived SD

% coefVar = 0.1; % coefVar is defined before the first block
sd = round(mean * coefVar, 3); % calc SD from coefVar for different sizes of variation

% nSim is defined in first block
% Number of simulations:
% nSim = 10;

% Seeds is defined in first block
% Seeds: each simulation requires a different seed
% seeds = 1:nSim;

% The for-loop will be used to calculate the conduction velocity (CV_myelin)
% between node 15 and 35, and the voltage trace of node 20,25,30 (AP_myelin).
CV_all = zeros(1,nSim);
AP_all = cell(nSim, 1);

for i = 1:nSim
    
    % Get parameter values
    par = all_var(mean, sd, seeds(i));
    
    % Run model
    [MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);
    
    % Calculate conduction velocity between node 15 and 35
    CV_all(i) = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);
    
    % Get action potential across node 20, 25, and 30
    AP_all{i} = MEMBRANE_POTENTIAL(:,15:35);
end

if exist('coefVar', 'var') == 1
    save(strcat('Results\CoefVar\AP_all_CoefVar', string(coefVar), '.mat'), 'AP_all');
    save(strcat('Results\CoefVar\CV_all_CoefVar', string(coefVar), '.mat'), 'CV_all');
elseif exist('coefVar', 'var') == 0
    save(strcat('Results\literatureSD\AP_all_literature_SD', string(sd),'.mat'), 'AP_all');
    save(strcat('Results\literatureSD\CV_all_literature_SD', string(sd),'.mat'), 'CV_all');
end

%%
rng(1)
a = normrnd(50, 5, 51,1);

rng(2)
b = normrnd(50, 5, 51,1);

rng(1)
a-b
1+1
3*3
c = normrnd(50, 5, 51,1)
a-c