%% Investigate true mean values
% run "Setup()"
%% Variable periaxonal space width
peri_trueMean = zeros(10,4);
peri_trueSD = zeros(10,4);
peri_trueMean1 = zeros(10,4);

mean_peri = 6.477;
sd_peri = [0.1*mean_peri, 0.2*mean_peri, 0.3*mean_peri, 1];

% Number of simulations:
nSim = 10;

% Number of parameter values
nPar = 4;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

for j = 1:nPar
    for i = 1:nSim
        par = PeriaxonalSpaceWidth_var(mean_peri, sd_peri(j), seeds(i));
        peri_trueMean(i,j) = mean(par.myel.geo.peri.value.vec(:,3));
        peri_trueSD(i,j) = mean(par.myel.geo.peri.value.vec(:,3)) + std(par.myel.geo.peri.value.vec(:,3));
        peri_trueMean1(i,j) = mean(par.myel.geo.peri.value.vec(15:35,3));
    end
end
peri_trueMean = [peri_trueMean(:,1); peri_trueMean(:,2); peri_trueMean(:,3); peri_trueMean(:,4)];
peri_trueSD = [peri_trueSD(:,1); peri_trueSD(:,2); peri_trueSD(:,3); peri_trueSD(:,4)];
peri_trueMean1 = [peri_trueMean1(:,1); peri_trueMean1(:,2); peri_trueMean1(:,3); peri_trueMean1(:,4)];


%% Variable myelin thickness
clear mean
myelin_trueMean = zeros(10,4);
myelin_trueSD = zeros(10,4);
myelin_trueMean1 = zeros(10,4);

mean_myelin = 0.11;
sd_myelin = [0.1*mean_myelin, 0.2*mean_myelin, 0.3*mean_myelin, 0.04];

% Number of simulations:
nSim = 10;

% Number of parameter values
nPar = 4;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

for j = 1:nPar
    for i = 1:nSim
        par = MyelinThickness_var(mean_myelin, sd_myelin(j), seeds(i));
        myelin_trueMean(i,j) = mean(par.myel.geo.width.value.vec(:,3));
        myelin_trueSD(i,j) = mean(par.myel.geo.width.value.vec(:,3)) + std(par.myel.geo.width.value.vec(:,3));
        myelin_trueMean1(i,j) = mean(par.myel.geo.width.value.vec(15:35,3));
    end
end
myelin_trueMean = [myelin_trueMean(:,1); myelin_trueMean(:,2); myelin_trueMean(:,3); myelin_trueMean(:,4)];
myelin_trueSD = [myelin_trueSD(:,1); myelin_trueSD(:,2); myelin_trueSD(:,3); myelin_trueSD(:,4)];
myelin_trueMean1 = [myelin_trueMean1(:,1); myelin_trueMean1(:,2); myelin_trueMean1(:,3); myelin_trueMean1(:,4)];

%% Variable internode length
inode_trueMean = zeros(10,4);
inode_trueSD = zeros(10,4);
inode_trueMean1 = zeros(10,4);

mean_inode = 50.32;
sd_inode = [0.1*mean_inode, 0.2*mean_inode, 0.3*mean_inode, 5];

% Number of simulations:
nSim = 10;

% Number of parameter values
nPar = 4;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

for j = 1:nPar
    for i = 1:nSim
        par = InternodeLength_var(mean_inode, sd_inode(j), seeds(i));
        inode_trueMean(i,j) = mean(sum(par.intn.seg.geo.length.value.vec,2));
        inode_trueSD(i,j) = mean(sum(par.intn.seg.geo.length.value.vec,2)) + std(sum(par.intn.seg.geo.length.value.vec,2));
        inode_trueMean1(i,j) = mean(par.intn.geo.length.value.vec(15:35));
    end
end
inode_trueMean = [inode_trueMean(:,1); inode_trueMean(:,2); inode_trueMean(:,3); inode_trueMean(:,4)];
inode_trueSD = [inode_trueSD(:,1); inode_trueSD(:,2); inode_trueSD(:,3); inode_trueSD(:,4)];
inode_trueMean1 = [inode_trueMean1(:,1); inode_trueMean1(:,2); inode_trueMean1(:,3); inode_trueMean1(:,4)];


%%
value = [inode_trueMean; inode_trueSD];
%Set label
label = [repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1);
     repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1)];
label = categorical(label);

nodes = [repmat({'Mean'},40,1);
    repmat({'Mean + SD'},40,1)];

coefVar = categorical(nodes);

figure;
boxchart(label,value,'GroupByColor',nodes);
hold on
yline(50.32, "--",'displayname', 'Set mean');
ylabel("")
legend('Location','eastoutside');
legend('boxoff')
title('A. Internode Length','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off

%%
value = [myelin_trueMean; myelin_trueSD];
%Set label
label = [repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1);
     repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1)];
label = categorical(label);

nodes = [repmat({'Mean'},40,1);
    repmat({'Mean + SD'},40,1)];

coefVar = categorical(nodes);

figure;
boxchart(label,value,'GroupByColor',nodes);
hold on
yline(0.1170, "--",'displayname', 'Set mean');
ylabel("")
legend('Location','eastoutside');
legend('boxoff')
title('B. Myelin Thickness','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off

%%
value = [peri_trueMean; peri_trueSD];
%Set label
label = [repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1);
     repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1)];
label = categorical(label);

nodes = [repmat({'Mean'},40,1);
    repmat({'Mean + SD'},40,1)];

coefVar = categorical(nodes);

figure;
boxchart(label,value,'GroupByColor',nodes);
hold on
yline(6.477, "--",'displayname', 'Set Mean');
ylabel("Mean")
legend('Location','eastoutside');
legend('boxoff')
title('C. Periaxonal Space Width','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off


%% ALL
%% Variable periaxonal space width
peri_trueMean = zeros(10,4);
peri_trueSD = zeros(10,4);
peri_trueMean1 = zeros(10,4);

mean_peri = [50.32, 0.1170, 6.477];
sd_peri = [0.1*mean_peri; 0.2*mean_peri; 0.3*mean_peri; [5, 0.04, 1]];

% Number of simulations:
nSim = 10;

% Number of parameter values
nPar = 4;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

for j = 1:nPar
    for i = 1:nSim
        par = all_var(mean_peri, sd_peri(j,:), seeds(i));
        peri_trueMean(i,j) = mean(par.myel.geo.peri.value.vec(:,3));
        peri_trueSD(i,j) = mean(par.myel.geo.peri.value.vec(:,3)) + std(par.myel.geo.peri.value.vec(:,3));
        peri_trueMean1(i,j) = mean(par.myel.geo.peri.value.vec(15:35,3));
    end
end
peri_trueMean = [peri_trueMean(:,1); peri_trueMean(:,2); peri_trueMean(:,3); peri_trueMean(:,4)];
peri_trueSD = [peri_trueSD(:,1); peri_trueSD(:,2); peri_trueSD(:,3); peri_trueSD(:,4)];
peri_trueMean1 = [peri_trueMean1(:,1); peri_trueMean1(:,2); peri_trueMean1(:,3); peri_trueMean1(:,4)];


%% Variable myelin thickness
clear mean
myelin_trueMean = zeros(10,4);
myelin_trueSD = zeros(10,4);
myelin_trueMean1 = zeros(10,4);


mean_myelin = [50.32, 0.1170, 6.477];
sd_myelin = [0.1*mean_myelin; 0.2*mean_myelin; 0.3*mean_myelin; [5, 0.04, 1]];

% Number of simulations:
nSim = 10;

% Number of parameter values
nPar = 4;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

for j = 1:nPar
    for i = 1:nSim
        par = all_var(mean_myelin, sd_myelin(j,:), seeds(i));
        myelin_trueMean(i,j) = mean(par.myel.geo.width.value.vec(:,3));
        myelin_trueSD(i,j) = mean(par.myel.geo.width.value.vec(:,3)) + std(par.myel.geo.width.value.vec(:,3));
        myelin_trueMean1(i,j) = mean(par.myel.geo.width.value.vec(15:35,3));
    end
end
myelin_trueMean = [myelin_trueMean(:,1); myelin_trueMean(:,2); myelin_trueMean(:,3); myelin_trueMean(:,4)];
myelin_trueSD = [myelin_trueSD(:,1); myelin_trueSD(:,2); myelin_trueSD(:,3); myelin_trueSD(:,4)];
myelin_trueMean1 = [myelin_trueMean1(:,1); myelin_trueMean1(:,2); myelin_trueMean1(:,3); myelin_trueMean1(:,4)];

%% Variable internode length
inode_trueMean = zeros(10,4);
inode_trueSD = zeros(10,4);
inode_trueMean1 = zeros(10,4);

mean_inode = [50.32, 0.1170, 6.477];
sd_inode = [0.1*mean_inode; 0.2*mean_inode; 0.3*mean_inode; [5, 0.04, 1]];

% Number of simulations:
nSim = 10;

% Number of parameter values
nPar = 4;

% Seeds: each simulation requires a different seed
seeds = 1:nSim;

for j = 1:nPar
    for i = 1:nSim
        par = all_var(mean_inode, sd_inode(j,:), seeds(i));
        inode_trueMean(i,j) = mean(sum(par.intn.seg.geo.length.value.vec,2));
        inode_trueSD(i,j) = mean(sum(par.intn.seg.geo.length.value.vec,2)) + std(sum(par.intn.seg.geo.length.value.vec,2));
        inode_trueMean1(i,j) = mean(par.intn.geo.length.value.vec(15:35));
    end
end
inode_trueMean = [inode_trueMean(:,1); inode_trueMean(:,2); inode_trueMean(:,3); inode_trueMean(:,4)];
inode_trueSD = [inode_trueSD(:,1); inode_trueSD(:,2); inode_trueSD(:,3); inode_trueSD(:,4)];
inode_trueMean1 = [inode_trueMean1(:,1); inode_trueMean1(:,2); inode_trueMean1(:,3); inode_trueMean1(:,4)];


%%
value = [inode_trueMean; inode_trueSD];
%Set label
label = [repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1);
     repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1)];
label = categorical(label);

nodes = [repmat({'Mean'},40,1);
    repmat({'Mean + SD'},40,1)];

coefVar = categorical(nodes);

figure;
boxchart(label,value,'GroupByColor',nodes);
hold on
yline(50.32, "--",'displayname', 'Set mean');
ylabel("")
legend('Location','eastoutside');
legend('boxoff')
title('A. Internode Length','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off

%%
value = [myelin_trueMean; myelin_trueSD];
%Set label
label = [repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1);
     repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1)];
label = categorical(label);

nodes = [repmat({'Mean'},40,1);
    repmat({'Mean + SD'},40,1)];

coefVar = categorical(nodes);

figure;
boxchart(label,value,'GroupByColor',nodes);
hold on
yline(0.1170, "--",'displayname', 'Set mean');
ylabel("")
legend('Location','eastoutside');
legend('boxoff')
title('B. Myelin Thickness','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off

%%
value = [peri_trueMean; peri_trueSD];
%Set label
label = [repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1);
     repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
     repmat({'Biological CoefVar'},10,1)];
label = categorical(label);

nodes = [repmat({'Mean'},40,1);
    repmat({'Mean + SD'},40,1)];

coefVar = categorical(nodes);

figure;
boxchart(label,value,'GroupByColor',nodes);
hold on
yline(6.477, "--",'displayname', 'Set Mean');
ylabel("Mean")
legend('Location','eastoutside');
legend('boxoff')
title('C. Periaxonal Space Width','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off