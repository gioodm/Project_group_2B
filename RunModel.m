%% All constant
% First, run "Setup()" in command window

% Get parameter valies
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
sd = 1;
%sd = 1.94; %CV = 0.3

% Number of simulations:
nSim = 10;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

% The for-loop will be used to calculate the conduction velocity (CV_peri)
% between node 15 and 35, and the voltage trace of node 20,25,30 (AP_peri).
CV_peri = zeros(1,nSim);
AP_peri = cell(nSim, 1);

for i = 1:nSim
    
    % Get parameter valies
    par = PeriaxonalSpaceWidth_var(mean, sd, seeds(i));
    
    % Run model
    [MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);
    
    % Calculate conduction velocity between node 15 and 35
    CV_peri(i) = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);
    
    % Get action potential across node 20, 25, and 30
    AP_peri{i} = MEMBRANE_POTENTIAL(:,15:35);
end

%% Variable internode length
% First, run "Setup()" in command window

mean = 50.32;
%sd = 5;
sd = 15.096; %CV = 0.3

% Number of simulations:
nSim = 10;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

% The for-loop will be used to calculate the conduction velocity (CV_inode)
% between node 15 and 35, and the voltage trace of node 20,25,30 (AP_inode).
CV_inode = zeros(1,nSim);
AP_inode = cell(nSim, 1);

for i = 1:nSim
    
    % Get parameter valies
    par = InternodeLength_var(mean, sd, seeds(i));
    
    % Run model
    [MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);
    
    % Calculate conduction velocity between node 15 and 35
    CV_inode(i) = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);
    
    % Get action potential across node 20, 25, and 30
    AP_inode{i} = MEMBRANE_POTENTIAL(:,15:35);
end

%% Variable myelin thickness
% First, run "Setup()" in command window

mean = 0.1170;
%sd = 0.04;
sd = 0.0117; %CV = 0.1
%sd = 0.0234; %CV = 0.2
%sd = 0.0351; %CV = 0.3

% Number of simulations:
nSim = 10;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

% The for-loop will be used to calculate the conduction velocity (CV_myelin)
% between node 15 and 35, and the voltage trace of node 20,25,30 (AP_myelin).
CV_myelin = zeros(1,nSim);
AP_myelin = cell(nSim, 1);

for i = 1:nSim
    
    % Get parameter valies
    par = MyelinThickness_var(mean, sd, seeds(i));
    
    % Run model
    [MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);
    
    % Calculate conduction velocity between node 15 and 35
    CV_myelin(i) = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);
    
    % Get action potential across node 20, 25, and 30
    AP_myelin{i} = MEMBRANE_POTENTIAL(:,15:35);
end

%% All variable
% First, run "Setup()" in command window
clear AP_all
clear CV_all
mean = [50.32, 0.1170, 6.477];
%sd = [5, 0.04, 1];
sd = [5.032, 0.0117, 0.6477]; %CV = 0.1
%sd = [10.064, 0.0234, 1.2954]; %CV = 0.2
%sd = [15.096, 0.0351, 1.94]; %CV = 0.3

% Number of simulations:
nSim = 10;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

% The for-loop will be used to calculate the conduction velocity (CV_myelin)
% between node 15 and 35, and the voltage trace of node 20,25,30 (AP_myelin).
CV_all = zeros(1,nSim);
AP_all = cell(nSim, 1);
for i = 1:nSim
    
    % Get parameter valies
    par = all_var(mean, sd, seeds(i));
    
    % Run model
    [MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR] = Model(par);
    
    % Calculate conduction velocity between node 15 and 35
    CV_all(i) = velocities(MEMBRANE_POTENTIAL, INTERNODE_LENGTH, TIME_VECTOR(2)-TIME_VECTOR(1), [15, 35]);
    
    % Get action potential across node 20, 25, and 30
    AP_all{i} = MEMBRANE_POTENTIAL(:,15:35);
end


%% Boxplots of conduction velocity
label = [repmat({'Internode Length'},10,1);
    repmat({'Periaxonal Space Width'},10,1);
    repmat({'Myelin Thickness'},10,1);
    repmat({'All'},10,1)];
namedLabels = categorical(label);
value = [CV_inode'; CV_peri'; CV_myelin'; CV_all'];
figure;
boxchart(namedLabels,value)
hold on
yline(CV_constant,"--")
ylabel("Conduction Velocity (m/s)")
title("CV = 0.3")
hold off

%% Perform PCA
AP = [AP_constant, AP_inode, AP_myelin, AP_peri, AP_all];
[coeff,score,latent, ~, explained] = pca(AP');

%% Make PCA plot: color by group
figure;
scatter(score(2:11,1), score(2:11,2),'filled', "b",'displayname', 'Internode Length');
hold on
scatter(score(12:21,1), score(12:21,2), 'filled',"r",'displayname', 'Myelin Thickness');
scatter(score(22:31,1), score(22:31,2), 'filled',"g",'displayname', 'Periaxonal Space Width');
scatter(score(32:41,1), score(32:41,2), 'filled',"m",'displayname', 'All Variable');
scatter(score(1,1), score(1,2), 'filled',"k",'displayname', 'All Constant');
xlabel(append("PC1 (",num2str(round(explained(1),2)), "%)"))
ylabel(append("PC2 (",num2str(round(explained(2),2)), "%)"))
title("PCA plot")
grid on
legend('Location','eastoutside')
legend('boxoff')
hold off


%% Make PCA plot: color by max peak height
figure;
scatter(score(:,1), score(:,2), [], max(AP), "filled");
hold on
scatter(score(1,1), score(1,2), "bx")
xlabel(append("PC1 (",num2str(round(explained(1),2)), "%)"))
ylabel(append("PC2 (",num2str(round(explained(2),2)), "%)"))
title("PCA plot")
grid on
hold off

%% Make PCA plot: color by CV
CV = [CV_constant, CV_inode, CV_myelin, CV_peri, CV_all];

figure;
scatter(score(:,1), score(:,2),[], CV, 'filled');
hold on
scatter(score(1,1), score(1,2), "bx");
xlabel(append("PC1 (",num2str(round(explained(1),2)), "%)"))
ylabel(append("PC2 (",num2str(round(explained(2),2)), "%)"))
title("PCA plot")
grid on
hold off

%% peak height vs CV
figure;
scatter(CV,max(AP))

%% Voltage trace
figure;
plot(AP(:,1),"k");
hold on
plot(AP(:,2:11), "b")
plot(AP(:,12:21), "r")
plot(AP(:,22:31), "g")
plot(AP(:,32:41), "m")
%%
figure;
scatter(score(:,1), score(:,2), [], [1, repmat(2,1,10), repmat(3,1,10), repmat(4,1,10)], "filled");
hold on
scatter(score(1,1), score(1,2), "bx")
xlabel(append("PC1 (",num2str(round(explained(1),2)), "%)"))
ylabel(append("PC2 (",num2str(round(explained(2),2)), "%)"))
title("PCA plot")
grid on
hold off
%%
boxplot([CV_inode', CV_peri', CV_myelin'], 'Labels',{'Internode Length','Periaxonal Space Width','Myelin Thickness'})
hold on
yline(CV_constant,"--")

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