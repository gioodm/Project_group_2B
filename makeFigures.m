%% Retrieve data for variable coefficient of variation

% Directory of files (needs to be changed!)
d = 'C:\Users\Gebruiker\Documents\GitHub\Project_group_2B\Results\CoefVar\';
files = dir(d);
files = files([files.bytes] ~=0);

% AP: variable internode length
inode_files = files([4,5,6],:);
inode_peakSize = zeros(10, size(inode_files,1));    % Peak size/height
inode_peakWidth = zeros(10, size(inode_files,1));   % Peak width
inode_sd = zeros(10, size(inode_files,1));       % Height-width ratio
inode_area = zeros(10, size(inode_files,1));          % Area
inode_APvec = cell(size(inode_files,1),1);          % AP vector
for i = 1:size(inode_files,1)
    file_i = inode_files(i,:);
    
    %load file
    load(append(d,file_i.name));
    
    % Extract peak height, width and ratio
    %[avg_peakSize, avg_width, peak_width_ratio] = peak_width(AP_inode);
    [avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP_inode);
    inode_peakSize(:,i) = avg_peakSize;
    inode_peakWidth(:,i) = avg_width;
    inode_sd(:,i) = sd_peakSize;
    inode_area(:,i) = avg_peakArea;
    
    %Make AP vector (voltages for each node in a single vector)
    vec = zeros(840021,10);
    for j = 1:10
        vec(:,j) = reshape(AP_inode{j,1},1,[]);
    end
    inode_APvec{i,1} =  vec;
end

clear AP_inode

% CV: variable internode length
inode_files_CV = files([16,17,18],:);
inode_CV = zeros(10, size(inode_files_CV,1));
for i = 1:size(inode_files_CV,1)
    file_i = inode_files_CV(i,:);
    load(append(d,file_i.name));
    inode_CV(:,i) = CV_inode;
end

clear CV_inode

% AP: Variable Myelin Thickness
myelin_files = files([7,8,9],:);
myelin_peakSize = zeros(10, size(myelin_files,1));
myelin_peakWidth = zeros(10, size(myelin_files,1));
myelin_sd = zeros(10, size(myelin_files,1));
myelin_area = zeros(10, size(myelin_files,1));
myelin_APvec = cell(size(myelin_files,1),1);
for i = 1:size(myelin_files,1)
    file_i = myelin_files(i,:);
    load(append(d,file_i.name));
    %[avg_peakSize, avg_width, peak_width_ratio] = peak_width(AP_myelin);
    [avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP_myelin);
    myelin_peakSize(:,i) = avg_peakSize;
    myelin_peakWidth(:,i) = avg_width;
    myelin_sd(:,i) = sd_peakSize;
    myelin_area(:,i) = avg_peakArea;
    
    vec = zeros(840021,10);
    for j = 1:10
        vec(:,j) = reshape(AP_myelin{j,1},1,[]);
    end
    myelin_APvec{i,1} =  vec;
end

clear AP_myelin

% CV: Variable Myelin Thickness
myelin_files_CV = files([19,20,21],:);
myelin_CV = zeros(10, size(myelin_files_CV,1));
for i = 1:size(myelin_files_CV,1)
    file_i = myelin_files_CV(i,:);
    load(append(d,file_i.name));
    myelin_CV(:,i) = CV_myelin;
end

clear CV_myelin

% AP: Variable Periaxonal space width
peri_files = files([10,11,12],:);
peri_peakSize = zeros(10, size(peri_files,1));
peri_peakWidth = zeros(10, size(peri_files,1));
peri_sd = zeros(10, size(peri_files,1));
peri_area = zeros(10, size(peri_files,1));
peri_APvec = cell(size(peri_files,1),1);
for i = 1:size(peri_files,1)
    file_i = peri_files(i,:);
    load(append(d,file_i.name));
    [avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP_peri);
    peri_peakSize(:,i) = avg_peakSize;
    peri_peakWidth(:,i) = avg_width;
    peri_sd(:,i) = sd_peakSize;
    peri_area(:,i) = avg_peakArea;
    vec = zeros(840021,10);
    for j = 1:10
        vec(:,j) = reshape(AP_peri{j,1},1,[]);
    end
    peri_APvec{i,1} = vec;
end

clear AP_peri

% CV: Variable Periaxonal space width
peri_files_CV = files([22,23,24],:);
peri_CV = zeros(10, size(peri_files_CV,1));
for i = 1:size(peri_files_CV,1)
    file_i = peri_files_CV(i,:);
    load(append(d,file_i.name));
    peri_CV(:,i) = CV_peri;
end

clear CV_peri

% AP: All Variable
all_files = files([1,2,3],:);
all_peakSize = zeros(10, size(all_files,1));
all_peakWidth = zeros(10, size(all_files,1));
all_sd = zeros(10, size(all_files,1));
all_area = zeros(10, size(all_files,1));
all_APvec = cell(size(all_files,1),1);
for i = 1:size(all_files,1)
    file_i = all_files(i,:);
    load(append(d,file_i.name));
    [avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP_all);
    all_peakSize(:,i) = avg_peakSize;
    all_peakWidth(:,i) = avg_width;
    all_sd(:,i) = sd_peakSize;
    all_area(:,i) = avg_peakArea;
    vec = zeros(840021,10);
    for j = 1:10
        vec(:,j) = reshape(AP_all{j,1},1,[]);
    end
    all_APvec{i,1} = vec;
end

clear AP_all

% CV: All Variable
all_files_CV = files([13, 14, 15],:);
all_CV = zeros(10, size(all_files_CV,1));
for i = 1:size(all_files_CV,1)
    file_i = all_files_CV(i,:);
    load(append(d,file_i.name));
    all_CV(:,i) = CV_all;
end

clear CV_all

%% Retrieve data for biological variation

% Directory of files (needs to be changed!)
d = 'C:\Users\Gebruiker\Documents\GitHub\Project_group_2B\Results\BioParam\';
files = dir(d);
files = files([files.bytes] ~=0);
files = files(2:11,:);

% Load all files
for i = 1:size(files,1)
    file_i = files(i,:);
    load(append(d,file_i.name));
end

% Internode Length
inode_CV(:,4) = CV_inode;

[avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP_inode);
inode_peakSize(:,4) = avg_peakSize;
inode_peakWidth(:,4) = avg_width;
inode_sd(:,4) = sd_peakSize;
inode_area(:,4) = avg_peakArea;

vec = zeros(840021,10);
for j = 1:10
    vec(:,j) = reshape(AP_inode{j,1},1,[]);
end
inode_APvec{4,1} = vec;

clear AP_inode
clear CV_inode

% Myelin Thickness
myelin_CV(:,4) = CV_myelin;

[avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP_myelin);
myelin_peakSize(:,4) = avg_peakSize;
myelin_peakWidth(:,4) = avg_width;
myelin_sd(:,4) = sd_peakSize;
myelin_area(:,4) = avg_peakArea;

vec = zeros(840021,10);
for j = 1:10
    vec(:,j) = reshape(AP_myelin{j,1},1,[]);
end
myelin_APvec{4,1} = vec;

clear AP_myelin
clear CV_myelin

% Periaxonal Space Width
peri_CV(:,4) = CV_peri;

[avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP_peri);
peri_peakSize(:,4) = avg_peakSize;
peri_peakWidth(:,4) = avg_width;
peri_sd(:,4) = sd_peakSize;
peri_area(:,4) = avg_peakArea;

vec = zeros(840021,10);
for j = 1:10
    vec(:,j) = reshape(AP_peri{j,1},1,[]);
end
peri_APvec{4,1} = vec;

clear AP_peri
clear CV_peri

% All Variable
all_CV(:,4) = CV_all;

[avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP_all);
all_peakSize(:,4) = avg_peakSize;
all_peakWidth(:,4) = avg_width;
all_sd(:,4) = sd_peakSize;
all_area(:,4) = avg_peakArea;

vec = zeros(840021,10);
for j = 1:10
    vec(:,j) = reshape(AP_all{j,1},1,[]);
end
all_APvec{4,1} = vec;

clear AP_all
clear CV_all
%% Make box plots
%Set label
label = [repmat({'All'},40,1);
    repmat({'Internode Length'},40,1);
    repmat({'Myelin Thickness'},40,1);
    repmat({'Periaxonal Space Width'},40,1)];
label = categorical(label);

coefVar = [repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
    repmat({'Biological CoefVar'},10,1);
    repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
    repmat({'Biological CoefVar'},10,1);
    repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
    repmat({'Biological CoefVar'},10,1);
    repmat({'CoefVar = 0.1'},10,1);
    repmat({'CoefVar = 0.2'},10,1);
    repmat({'CoefVar = 0.3'},10,1);
    repmat({'Biological CoefVar'},10,1)];

coefVar = categorical(coefVar);

%% Boxplot of conduction velocity
value = [all_CV(:,1); all_CV(:,2); all_CV(:,3); all_CV(:,4)
    inode_CV(:,1); inode_CV(:,2); inode_CV(:,3); inode_CV(:,4);
    myelin_CV(:,1); myelin_CV(:,2); myelin_CV(:,3); myelin_CV(:,4);
    peri_CV(:,1); peri_CV(:,2); peri_CV(:,3); peri_CV(:,4)];

figure;
boxchart(label,value,'GroupByColor',coefVar);
colororder(validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple'))
hold on
yline(2.8445, "--",'displayname', 'No variation');
ylabel("Conduction velocity (m/s)")
%legend('CoefVar = 0.1','CoefVar = 0.2','CoefVar = 0.3','')
legend('Location','eastoutside');
legend('boxoff')
title('A. Conduction Velocity','FontSize',14)
ax = gca;
ax.FontSize = 14; 
ax.TitleHorizontalAlignment = 'left';
hold off

%% t-test
[h p] = ttest(peri_CV(:,1)-2.8445);
p

%%
pvalues = [0.0157, 0.0020, 3.3961E-4, 7.9488E-4, 0.7326, 0.7264, 0.4600, 0.7546, 0.9641, 0.1935, 0.1080, 0.0900, 0.9819, 0.5889, 0.4329, 0.4840]
[FDR, Q]=mafdr(pvalues);
FDR
%% boxplot of peak height
value = [all_peakSize(:,1); all_peakSize(:,2); all_peakSize(:,3); all_peakSize(:,4);
    inode_peakSize(:,1); inode_peakSize(:,2); inode_peakSize(:,3); inode_peakSize(:,4);
    myelin_peakSize(:,1); myelin_peakSize(:,2); myelin_peakSize(:,3); myelin_peakSize(:,4);
    peri_peakSize(:,1); peri_peakSize(:,2); peri_peakSize(:,3); peri_peakSize(:,4)];

figure;
boxchart(label,value,'GroupByColor',coefVar);
colororder(validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple'))
hold on
yline(7.2448, "--",'displayname', 'No variation');
ylabel("Average voltage peak value (mV)")
legend('Location','eastoutside');
legend('boxoff')
title('B. Average Voltage Peak Value','FontSize',14)
ax = gca;
ax.FontSize = 14; 
ax.TitleHorizontalAlignment = 'left';
hold off

%% t-test
[h p] = ttest(peri_peakSize(:,1)-7.2448);
p
%%
pvalues = [0.0681, 0.0196, 0.0060, 5.5895E-4, 0.6849, 0.7290, 0.7862, 0.6847, 0.8622, 0.1767, 0.0542, 0.0268, 0.6001, 0.5887, 0.5768, 0.5977]
[FDR, Q]=mafdr(pvalues);
Q  
%% Width
value = [ all_peakWidth(:,1); all_peakWidth(:,2); all_peakWidth(:,3); all_peakWidth(:,4);
    inode_peakWidth(:,1); inode_peakWidth(:,2); inode_peakWidth(:,3); inode_peakWidth(:,4);
    myelin_peakWidth(:,1); myelin_peakWidth(:,2); myelin_peakWidth(:,3); myelin_peakWidth(:,4);
    peri_peakWidth(:,1); peri_peakWidth(:,2); peri_peakWidth(:,3); peri_peakWidth(:,4)];

figure;
boxchart(label,value,'GroupByColor',coefVar);
colororder(validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple'))
hold on
yline(0.2463, "--",'displayname', 'No variation');
ylabel("Average half-peak width (\mus)")
legend('Location','eastoutside');
legend('boxoff')
title('C. Half-Peak Width','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off


%% peak SD
value = [all_sd(:,1); all_sd(:,2); all_sd(:,3); all_sd(:,4);
    inode_sd(:,1); inode_sd(:,2); inode_sd(:,3); inode_sd(:,4);
    myelin_sd(:,1); myelin_sd(:,2); myelin_sd(:,3); myelin_sd(:,4);
    peri_sd(:,1); peri_sd(:,2); peri_sd(:,3); peri_sd(:,4)];

figure;
boxchart(label,value,'GroupByColor',coefVar);
colororder(validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple'))
ylabel("Standard deviation of voltage peak values (mV)")
legend('Location','eastoutside');
legend('boxoff')
title('C. Voltage Peak SD','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off

%% peak area
value = [all_area(:,1); all_area(:,2); all_area(:,3); all_area(:,4);
    inode_area(:,1); inode_area(:,2); inode_area(:,3); inode_area(:,4);
    myelin_area(:,1); myelin_area(:,2); myelin_area(:,3); myelin_area(:,4);
    peri_area(:,1); peri_area(:,2); peri_area(:,3); peri_area(:,4)];

figure;
boxchart(label,value,'GroupByColor',coefVar);
colororder(validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple'))
ylabel("AUC")
legend('Location','eastoutside');
legend('boxoff')
title('C. Area Under The Curve','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
hold off


%% Relationship between peak height and conduction velocity
value_cv = [all_CV(:,1); all_CV(:,2); all_CV(:,3); all_CV(:,4)
    inode_CV(:,1); inode_CV(:,2); inode_CV(:,3); inode_CV(:,4);
    myelin_CV(:,1); myelin_CV(:,2); myelin_CV(:,3); myelin_CV(:,4);
    peri_CV(:,1); peri_CV(:,2); peri_CV(:,3); peri_CV(:,4)];

value_height = [all_peakSize(:,1); all_peakSize(:,2); all_peakSize(:,3);  all_peakSize(:,4)
    inode_peakSize(:,1); inode_peakSize(:,2); inode_peakSize(:,3); inode_peakSize(:,4);
    myelin_peakSize(:,1); myelin_peakSize(:,2); myelin_peakSize(:,3); myelin_peakSize(:,4);
    peri_peakSize(:,1); peri_peakSize(:,2); peri_peakSize(:,3); peri_peakSize(:,4)];

% linearModel = fitlm(value_cv,value_height);
% slope = table2array(linearModel.Coefficients(2,1));
% intercept = table2array(linearModel.Coefficients(1,1));
% fittedline = @(x) intercept + x.*slope;

% figure;
% scatter(value_cv, value_height, "filled")
% hold on
% fplot(fittedline, [2.4 3], "LineWidth", 3)
% text(2.8,4,"R-squared = 0.567")
% xlabel("Conduction Velocity (m/s)")
% ylabel("Average peak height (mV)")
% xlim([2.4 3])
% grid on

coefvar_colors = validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple');
par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');

figure;
subplot(1,2,1)
scatter(value_cv(1:40), value_height(1:40),'filled','MarkerFaceColor',par_colors(1,:), 'MarkerEdgeColor',par_colors(1,:),'MarkerFaceAlpha',.6, 'MarkerFaceAlpha',1,'displayname', 'All');
hold on
scatter(value_cv(41:80), value_height(41:80), 'filled','MarkerFaceColor',par_colors(2,:),'MarkerEdgeColor',par_colors(2,:),'MarkerFaceAlpha',.6, 'MarkerFaceAlpha',1,'displayname', 'Internode Length');
scatter(value_cv(81:120), value_height(81:120), 'filled','MarkerFaceColor',par_colors(3,:),'MarkerEdgeColor',par_colors(3,:),'MarkerFaceAlpha',.6, 'MarkerFaceAlpha',1,'displayname', 'Myelin Thickness');
scatter(value_cv(121:160), value_height(121:160), 'filled','MarkerFaceColor',par_colors(4,:),'MarkerEdgeColor',par_colors(4,:),'MarkerFaceAlpha',.6, 'MarkerFaceAlpha',1,'displayname', 'Periaxonal Space Width');
xlabel("Conduction velocity (m/s)")
ylabel("Average voltage peak value (mV)")
title('A.','FontSize',14)
ax = gca;
ax.FontSize = 14;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

subplot(1,2,2)
scatter(value_cv([1:10,41:50,81:90,121:130]), value_height([1:10,41:50,81:90,121:130]),'filled','MarkerFaceColor',coefvar_colors(1,:), 'MarkerFaceAlpha',1,'displayname', 'CoefVar = 0.1');
hold on
scatter(value_cv([11:20,51:60,91:100,131:140]), value_height([11:20,51:60,91:100,131:140]),'filled','MarkerFaceColor',coefvar_colors(2,:), 'MarkerFaceAlpha',1,'displayname', 'CoefVar = 0.2');
scatter(value_cv([21:30,61:70,101:110,141:150]), value_height([21:30,61:70,101:110,141:150]), 'filled','MarkerFaceColor',coefvar_colors(3,:), 'MarkerFaceAlpha',1,'displayname', 'CoefVar = 0.3');
scatter(value_cv([31:40,71:80,111:120,151:160]), value_height([31:40,71:80,111:120,151:160]), 'filled','MarkerFaceColor',coefvar_colors(4,:), 'MarkerFaceAlpha',1,'displayname', 'Biological CoefVar');
xlabel("Conduction velocity (m/s)")
ylabel("Average voltage peak value (mV)")
title('B.','FontSize',14)
ax = gca;
ax.FontSize = 14;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

%% 2) Relationship between peak height and conduction velocity
value_cv = [all_CV(:,1); all_CV(:,2); all_CV(:,3); all_CV(:,4)
    inode_CV(:,1); inode_CV(:,2); inode_CV(:,3); inode_CV(:,4);
    myelin_CV(:,1); myelin_CV(:,2); myelin_CV(:,3); myelin_CV(:,4);
    peri_CV(:,1); peri_CV(:,2); peri_CV(:,3); peri_CV(:,4)];

value_height = [all_peakSize(:,1); all_peakSize(:,2); all_peakSize(:,3);  all_peakSize(:,4)
    inode_peakSize(:,1); inode_peakSize(:,2); inode_peakSize(:,3); inode_peakSize(:,4);
    myelin_peakSize(:,1); myelin_peakSize(:,2); myelin_peakSize(:,3); myelin_peakSize(:,4);
    peri_peakSize(:,1); peri_peakSize(:,2); peri_peakSize(:,3); peri_peakSize(:,4)];

par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');
figure;
subplot(1,2,1)
scatter(value_cv(1:40), value_height(1:40),'filled','MarkerFaceColor',par_colors(1,:),'MarkerFaceAlpha',.2,'displayname', 'All');
hold on
scatter(value_cv(121:160), value_height(121:160), 'filled','MarkerFaceColor',par_colors(4,:),'MarkerFaceAlpha',.2,'displayname', 'Periaxonal Space Width');
scatter(value_cv(41:80), value_height(41:80), 'filled','MarkerFaceColor',par_colors(2,:),'displayname', 'Internode Length');
scatter(value_cv(81:120), value_height(81:120), 'filled','MarkerFaceColor',par_colors(3,:),'MarkerFaceAlpha',.2,'displayname', 'Myelin Thickness');
xlabel("Conduction velocity (m/s)")
ylabel("Average voltage peak value (mV)")
title('A.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

subplot(1,2,2)
scatter(value_cv(1:40), value_height(1:40),'filled','MarkerFaceColor',par_colors(1,:),'MarkerFaceAlpha',.2,'displayname', 'All');
hold on
scatter(value_cv(121:160), value_height(121:160), 'filled','MarkerFaceColor',par_colors(4,:),'MarkerFaceAlpha',.2,'displayname', 'Periaxonal Space Width');
scatter(value_cv(41:80), value_height(41:80), 'filled','MarkerFaceColor',par_colors(2,:),'MarkerFaceAlpha',.2,'displayname', 'Internode Length');
scatter(value_cv(81:120), value_height(81:120), 'filled','MarkerFaceColor',par_colors(3,:),'displayname', 'Myelin Thickness');
xlabel("Conduction velocity (m/s)")
ylabel("Average voltage peak value (mV)")
title('B.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

%% 3) Relationship between peak height and conduction velocity
value_cv = [all_CV(:,1); all_CV(:,2); all_CV(:,3); all_CV(:,4)
    inode_CV(:,1); inode_CV(:,2); inode_CV(:,3); inode_CV(:,4);
    myelin_CV(:,1); myelin_CV(:,2); myelin_CV(:,3); myelin_CV(:,4);
    peri_CV(:,1); peri_CV(:,2); peri_CV(:,3); peri_CV(:,4)];

value_height = [all_peakSize(:,1); all_peakSize(:,2); all_peakSize(:,3);  all_peakSize(:,4)
    inode_peakSize(:,1); inode_peakSize(:,2); inode_peakSize(:,3); inode_peakSize(:,4);
    myelin_peakSize(:,1); myelin_peakSize(:,2); myelin_peakSize(:,3); myelin_peakSize(:,4);
    peri_peakSize(:,1); peri_peakSize(:,2); peri_peakSize(:,3); peri_peakSize(:,4)];

par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');
figure;
subplot(1,2,1)
scatter(value_cv(1:40), value_height(1:40),'filled','MarkerFaceColor',par_colors(1,:),'MarkerFaceAlpha',.1,'displayname', 'All');
hold on
scatter(value_cv(121:160), value_height(121:160), 'filled','MarkerFaceColor',par_colors(4,:),'MarkerFaceAlpha',.1,'displayname', 'Periaxonal Space Width');
scatter(value_cv(41:80), value_height(41:80),[],inode_trueMean1, 'filled','displayname', 'Internode Length');
scatter(value_cv(81:120), value_height(81:120), 'filled','MarkerFaceColor',par_colors(3,:),'MarkerFaceAlpha',.1,'displayname', 'Myelin Thickness');
xlabel("Conduction velocity (m/s)")
ylabel("Average voltage peak value (mV)")
title('C.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
ax.FontSize = 14; 
h = gca;
colorbar(h);
grid on
hold off

subplot(1,2,2)
scatter(value_cv(1:40), value_height(1:40),'filled','MarkerFaceColor',par_colors(1,:),'MarkerFaceAlpha',.1,'displayname', 'All');
hold on
scatter(value_cv(121:160), value_height(121:160), 'filled','MarkerFaceColor',par_colors(4,:),'MarkerFaceAlpha',.1,'displayname', 'Periaxonal Space Width');
scatter(value_cv(41:80), value_height(41:80), 'filled','MarkerFaceColor',par_colors(2,:),'MarkerFaceAlpha',.1,'displayname', 'Internode Length');
scatter(value_cv(81:120), value_height(81:120), [],myelin_trueMean1,'filled','displayname', 'Myelin Thickness');
xlabel("Conduction velocity (m/s)")
ylabel("Average voltage peak value (mV)")
title('D. ','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
ax.FontSize = 14; 
h = gca;
colorbar(h);
grid on
hold off

%% Relationship between CV and variation
value_sd = [all_sd(:,1); all_sd(:,2); all_sd(:,3); all_sd(:,4)
    inode_sd(:,1); inode_sd(:,2); inode_sd(:,3); inode_sd(:,4);
    myelin_sd(:,1); myelin_sd(:,2); myelin_sd(:,3); myelin_sd(:,4);
    peri_sd(:,1); peri_sd(:,2); peri_sd(:,3); peri_sd(:,4)];

value_sd = value_sd.^2;

value_cv = [all_CV(:,1); all_CV(:,2); all_CV(:,3); all_CV(:,4)
    inode_CV(:,1); inode_CV(:,2); inode_CV(:,3); inode_CV(:,4);
    myelin_CV(:,1); myelin_CV(:,2); myelin_CV(:,3); myelin_CV(:,4);
    peri_CV(:,1); peri_CV(:,2); peri_CV(:,3); peri_CV(:,4)];

value_height = [all_peakSize(:,1); all_peakSize(:,2); all_peakSize(:,3);  all_peakSize(:,4)
    inode_peakSize(:,1); inode_peakSize(:,2); inode_peakSize(:,3); inode_peakSize(:,4);
    myelin_peakSize(:,1); myelin_peakSize(:,2); myelin_peakSize(:,3); myelin_peakSize(:,4);
    peri_peakSize(:,1); peri_peakSize(:,2); peri_peakSize(:,3); peri_peakSize(:,4)];

coefvar_colors = validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple');
par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');

figure;
subplot(1,2,1)
scatter(value_cv(1:40), value_sd(1:40),'filled','MarkerFaceColor',par_colors(1,:),'displayname', 'All');
hold on
scatter(value_cv(41:80), value_sd(41:80), 'filled','MarkerFaceColor',par_colors(2,:),'displayname', 'Internode Length');
scatter(value_cv(81:120), value_sd(81:120), 'filled','MarkerFaceColor',par_colors(3,:), 'displayname', 'Myelin Thickness');
scatter(value_cv(121:160), value_sd(121:160), 'filled','MarkerFaceColor',par_colors(4,:), 'displayname', 'Periaxonal Space Width');
xlabel("Conduction velocity (m/s)")
ylabel("Variation of voltage peak value (mV^2)")
title('C.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

subplot(1,2,2)
scatter(value_cv([1:10,41:50,81:90,121:130]), value_sd([1:10,41:50,81:90,121:130]),'filled','MarkerFaceColor',coefvar_colors(1,:),'displayname', 'CoefVar = 0.1');
hold on
scatter(value_cv([11:20,51:60,91:100,131:140]), value_sd([11:20,51:60,91:100,131:140]), 'filled', 'MarkerFaceColor',coefvar_colors(2,:),'displayname','CoefVar = 0.2');
scatter(value_cv([21:30,61:70,101:110,141:150]), value_sd([21:30,61:70,101:110,141:150]), 'filled', 'MarkerFaceColor',coefvar_colors(3,:),'displayname','CoefVar = 0.3');
scatter(value_cv([31:40,71:80,111:120,151:160]), value_sd([31:40,71:80,111:120,151:160]), 'filled', 'MarkerFaceColor',coefvar_colors(4,:),'displayname', 'Biological CoefVar');
xlabel("Conduction velocity (m/s)")
ylabel("Variation of voltage peak value (mV^2)")
title('D.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

%% Relationship between peak and variation
value_sd = [all_sd(:,1); all_sd(:,2); all_sd(:,3); all_sd(:,4)
    inode_sd(:,1); inode_sd(:,2); inode_sd(:,3); inode_sd(:,4);
    myelin_sd(:,1); myelin_sd(:,2); myelin_sd(:,3); myelin_sd(:,4);
    peri_sd(:,1); peri_sd(:,2); peri_sd(:,3); peri_sd(:,4)];

value_sd = value_sd.^2;

value_cv = [all_CV(:,1); all_CV(:,2); all_CV(:,3); all_CV(:,4)
    inode_CV(:,1); inode_CV(:,2); inode_CV(:,3); inode_CV(:,4);
    myelin_CV(:,1); myelin_CV(:,2); myelin_CV(:,3); myelin_CV(:,4);
    peri_CV(:,1); peri_CV(:,2); peri_CV(:,3); peri_CV(:,4)];

value_height = [all_peakSize(:,1); all_peakSize(:,2); all_peakSize(:,3);  all_peakSize(:,4)
    inode_peakSize(:,1); inode_peakSize(:,2); inode_peakSize(:,3); inode_peakSize(:,4);
    myelin_peakSize(:,1); myelin_peakSize(:,2); myelin_peakSize(:,3); myelin_peakSize(:,4);
    peri_peakSize(:,1); peri_peakSize(:,2); peri_peakSize(:,3); peri_peakSize(:,4)];

coefvar_colors = validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple');
par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');

figure;
subplot(1,2,1)
scatter(value_height(1:40), value_sd(1:40),'filled','MarkerFaceColor',par_colors(1,:),'displayname', 'All');
hold on
scatter(value_height(41:80), value_sd(41:80), 'filled','MarkerFaceColor',par_colors(2,:),'displayname', 'Internode Length');
scatter(value_height(81:120), value_sd(81:120), 'filled','MarkerFaceColor',par_colors(3,:), 'displayname', 'Myelin Thickness');
scatter(value_height(121:160), value_sd(121:160), 'filled','MarkerFaceColor',par_colors(4,:), 'displayname', 'Periaxonal Space Width');
xlabel("Average voltage peak value (mV)")
ylabel("Variation of voltage peak value (mV^2)")
title('c.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

subplot(1,2,2)
scatter(value_height([1:10,41:50,81:90,121:130]), value_sd([1:10,41:50,81:90,121:130]),'filled','MarkerFaceColor',coefvar_colors(1,:),'displayname', 'CoefVar = 0.1');
hold on
scatter(value_height([11:20,51:60,91:100,131:140]), value_sd([11:20,51:60,91:100,131:140]), 'filled', 'MarkerFaceColor',coefvar_colors(2,:),'displayname','CoefVar = 0.2');
scatter(value_height([21:30,61:70,101:110,141:150]), value_sd([21:30,61:70,101:110,141:150]), 'filled', 'MarkerFaceColor',coefvar_colors(3,:),'displayname','CoefVar = 0.3');
scatter(value_height([31:40,71:80,111:120,151:160]), value_sd([31:40,71:80,111:120,151:160]), 'filled', 'MarkerFaceColor',coefvar_colors(4,:),'displayname', 'Biological CoefVar');
xlabel("Average voltage peak value (mV)")
ylabel("Variation of voltage peak value (mV^2)")
title('D.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

%% Relationship between peak value and area
value_sd = [all_sd(:,1); all_sd(:,2); all_sd(:,3); all_sd(:,4)
    inode_sd(:,1); inode_sd(:,2); inode_sd(:,3); inode_sd(:,4);
    myelin_sd(:,1); myelin_sd(:,2); myelin_sd(:,3); myelin_sd(:,4);
    peri_sd(:,1); peri_sd(:,2); peri_sd(:,3); peri_sd(:,4)];

value_sd = value_sd.^2;

value_cv = [all_CV(:,1); all_CV(:,2); all_CV(:,3); all_CV(:,4)
    inode_CV(:,1); inode_CV(:,2); inode_CV(:,3); inode_CV(:,4);
    myelin_CV(:,1); myelin_CV(:,2); myelin_CV(:,3); myelin_CV(:,4);
    peri_CV(:,1); peri_CV(:,2); peri_CV(:,3); peri_CV(:,4)];

value_height = [all_peakSize(:,1); all_peakSize(:,2); all_peakSize(:,3);  all_peakSize(:,4)
    inode_peakSize(:,1); inode_peakSize(:,2); inode_peakSize(:,3); inode_peakSize(:,4);
    myelin_peakSize(:,1); myelin_peakSize(:,2); myelin_peakSize(:,3); myelin_peakSize(:,4);
    peri_peakSize(:,1); peri_peakSize(:,2); peri_peakSize(:,3); peri_peakSize(:,4)];

value_area = [all_area(:,1); all_area(:,2); all_area(:,3);  all_area(:,4)
    inode_area(:,1); inode_area(:,2); inode_area(:,3); inode_area(:,4);
    myelin_area(:,1); myelin_area(:,2); myelin_area(:,3); myelin_area(:,4);
    peri_area(:,1); peri_area(:,2); peri_area(:,3); peri_area(:,4)];


value_width = [all_peakWidth(:,1); all_peakWidth(:,2); all_peakWidth(:,3);  all_peakWidth(:,4)
    inode_peakWidth(:,1); inode_peakWidth(:,2); inode_peakWidth(:,3); inode_peakWidth(:,4);
    myelin_peakWidth(:,1); myelin_peakWidth(:,2); myelin_peakWidth(:,3); myelin_peakWidth(:,4);
    peri_peakWidth(:,1); peri_peakWidth(:,2); peri_peakWidth(:,3); peri_peakWidth(:,4)];

coefvar_colors = validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple');
par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');

figure;
subplot(1,2,1)
scatter(value_height(1:40), value_area(1:40),'filled','MarkerFaceColor',par_colors(1,:),'displayname', 'All');
hold on
scatter(value_height(41:80), value_area(41:80), 'filled','MarkerFaceColor',par_colors(2,:),'displayname', 'Internode Length');
scatter(value_height(81:120), value_area(81:120), 'filled','MarkerFaceColor',par_colors(3,:), 'displayname', 'Myelin Thickness');
scatter(value_height(121:160), value_area(121:160), 'filled','MarkerFaceColor',par_colors(4,:), 'displayname', 'Periaxonal Space Width');
xlabel("Average voltage peak value (m/s)")
ylabel("AUC")
title('A.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

subplot(1,2,2)
scatter(value_height([1:10,41:50,81:90,121:130]), value_area([1:10,41:50,81:90,121:130]),'filled','MarkerFaceColor',coefvar_colors(1,:),'displayname', 'CoefVar = 0.1');
hold on
scatter(value_height([11:20,51:60,91:100,131:140]), value_area([11:20,51:60,91:100,131:140]), 'filled', 'MarkerFaceColor',coefvar_colors(2,:),'displayname','CoefVar = 0.2');
scatter(value_height([21:30,61:70,101:110,141:150]), value_area([21:30,61:70,101:110,141:150]), 'filled', 'MarkerFaceColor',coefvar_colors(3,:),'displayname','CoefVar = 0.3');
scatter(value_height([31:40,71:80,111:120,151:160]), value_area([31:40,71:80,111:120,151:160]), 'filled', 'MarkerFaceColor',coefvar_colors(4,:),'displayname', 'Biological CoefVar');
xlabel("Average voltage peak value")
ylabel("AUC")
title('B.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

%%
figure;
subplot(1,2,1)
scatter(value_height(1:40), value_width(1:40),'filled','MarkerFaceColor',par_colors(1,:),'displayname', 'All');
hold on
scatter(value_height(41:80), value_width(41:80), 'filled','MarkerFaceColor',par_colors(2,:),'displayname', 'Internode Length');
scatter(value_height(81:120), value_width(81:120), 'filled','MarkerFaceColor',par_colors(3,:), 'displayname', 'Myelin Thickness');
scatter(value_height(121:160), value_width(121:160), 'filled','MarkerFaceColor',par_colors(4,:), 'displayname', 'Periaxonal Space Width');
xlabel("Average voltage peak value (m/s)")
ylabel("Half-peak width (\mus)")
title('A.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

subplot(1,2,2)
scatter(value_height([1:10,41:50,81:90,121:130]), value_width([1:10,41:50,81:90,121:130]),'filled','MarkerFaceColor',coefvar_colors(1,:),'displayname', 'CoefVar = 0.1');
hold on
scatter(value_height([11:20,51:60,91:100,131:140]), value_width([11:20,51:60,91:100,131:140]), 'filled', 'MarkerFaceColor',coefvar_colors(2,:),'displayname','CoefVar = 0.2');
scatter(value_height([21:30,61:70,101:110,141:150]), value_width([21:30,61:70,101:110,141:150]), 'filled', 'MarkerFaceColor',coefvar_colors(3,:),'displayname','CoefVar = 0.3');
scatter(value_height([31:40,71:80,111:120,151:160]), value_width([31:40,71:80,111:120,151:160]), 'filled', 'MarkerFaceColor',coefvar_colors(4,:),'displayname', 'Biological CoefVar');
xlabel("Average voltage peak value")
ylabel("Half-peak width (\mus)")
title('B.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off
%% PCA plot
% prepare data
pcaPlot = [all_APvec{1,1}, all_APvec{2,1}, all_APvec{3,1}, all_APvec{4,1},...
    inode_APvec{1,1}, inode_APvec{2,1}, inode_APvec{3,1}, inode_APvec{4,1},... 
    myelin_APvec{1,1}, myelin_APvec{2,1}, myelin_APvec{3,1}, myelin_APvec{4,1},...
    peri_APvec{1,1}, peri_APvec{2,1}, peri_APvec{3,1}, peri_APvec{4,1}];

%%
[coeff,score,latent, ~, explained] = pca(pcaPlot');
%% PC1 vs PC2
coefvar_colors = validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple');
par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');

figure;
subplot(1,2,1)
scatter(score(1:40,1), score(1:40,2),'filled','MarkerFaceColor',par_colors(1,:),'displayname', 'All');
hold on
scatter(score(41:80,1), score(41:80,2), 'filled','MarkerFaceColor',par_colors(2,:),'displayname', 'Internode Length');
scatter(score(81:120,1), score(81:120,2), 'filled','MarkerFaceColor',par_colors(3,:),'displayname', 'Myelin Thickness');
scatter(score(121:160,1), score(121:160,2), 'filled','MarkerFaceColor',par_colors(4,:),'displayname', 'Periaxonal Space Width');
xlabel(append("PC1 (",num2str(round(explained(1),2)), "%)"))
ylabel(append("PC2 (",num2str(round(explained(2),2)), "%)"))
title('A.','FontSize',14)
ax = gca;
ax.FontSize = 14;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

subplot(1,2,2)
scatter(score([1:10,41:50,81:90,121:130],1), score([1:10,41:50,81:90,121:130],2),'filled','MarkerFaceColor',coefvar_colors(1,:),'displayname', 'CoefVar = 0.1');
hold on
scatter(score([11:20,51:60,91:100,131:140],1), score([11:20,51:60,91:100,131:140],2), 'filled','MarkerFaceColor',coefvar_colors(2,:),'displayname', 'CoefVar = 0.2');
scatter(score([21:30,61:70,101:110,141:150],1), score([21:30,61:70,101:110,141:150],2), 'filled','MarkerFaceColor',coefvar_colors(3,:),'displayname', 'CoefVar = 0.3');
scatter(score([31:40,71:80,111:120,151:160],1), score([31:40,71:80,111:120,151:160],2), 'filled','MarkerFaceColor',coefvar_colors(4,:),'displayname', 'Biological CoefVar');
xlabel(append("PC1 (",num2str(round(explained(1),2)), "%)"))
ylabel(append("PC2 (",num2str(round(explained(2),2)), "%)"))
title('B.','FontSize',14)
ax = gca;
ax.FontSize = 14; 
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

%% PC1 vs PC3
coefvar_colors = validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple');
par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');

figure;
subplot(1,2,1)
scatter(score(1:40,1), score(1:40,3),'filled','MarkerFaceColor',par_colors(1,:),'displayname', 'All');
hold on
scatter(score(41:80,1), score(41:80,3), 'filled','MarkerFaceColor',par_colors(2,:),'displayname', 'Internode Length');
scatter(score(81:120,1), score(81:120,3), 'filled','MarkerFaceColor',par_colors(3,:),'displayname', 'Myelin Thickness');
scatter(score(121:160,1), score(121:160,3), 'filled','MarkerFaceColor',par_colors(4,:),'displayname', 'Periaxonal Space Width');
xlabel(append("PC1 (",num2str(round(explained(1),3)), "%)"))
ylabel(append("PC2 (",num2str(round(explained(2),3)), "%)"))
title('A.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

subplot(1,2,2)
scatter(score([1:10,41:50,81:90,121:130],1), score([1:10,41:50,81:90,121:130],3),'filled','MarkerFaceColor',coefvar_colors(1,:),'displayname', 'CoefVar = 0.1');
hold on
scatter(score([11:20,51:60,91:100,131:140],1), score([11:20,51:60,91:100,131:140],3), 'filled','MarkerFaceColor',coefvar_colors(2,:),'displayname', 'CoefVar = 0.2');
scatter(score([21:30,61:70,101:110,141:150],1), score([21:30,61:70,101:110,141:150],3), 'filled','MarkerFaceColor',coefvar_colors(3,:),'displayname', 'CoefVar = 0.3');
scatter(score([31:40,71:80,111:120,151:160],1), score([31:40,71:80,111:120,151:160],3), 'filled','MarkerFaceColor',coefvar_colors(4,:),'displayname', 'Biological CoefVar');
xlabel(append("PC1 (",num2str(round(explained(1),3)), "%)"))
ylabel(append("PC2 (",num2str(round(explained(2),3)), "%)"))
title('B.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

%%

yValue = [repmat(1,40,1);
    repmat(2,40,1);
    repmat(3,40,1);
    repmat(4,40,1)];


coefvar_colors = validatecolor(["#E74C3C" "#8E44AD" "#16A085" "#F39C12"], 'multiple');
par_colors = validatecolor(["#DC0073" "#F5B700" "#00A1E4" "#04E762"], 'multiple');

figure;
scatter(score([1:10,41:50,81:90,121:130],1), yValue([1:10,41:50,81:90,121:130]),100,'filled','MarkerFaceColor',coefvar_colors(1,:),'MarkerFaceAlpha',.5,'displayname', 'CoefVar = 0.1');
hold on
scatter(score([11:20,51:60,91:100,131:140],1), yValue([11:20,51:60,91:100,131:140]),100, 'filled','MarkerFaceColor',coefvar_colors(2,:),'MarkerFaceAlpha',.5,'displayname', 'CoefVar = 0.2');
scatter(score([21:30,61:70,101:110,141:150],1), yValue([21:30,61:70,101:110,141:150]),100, 'filled','MarkerFaceColor',coefvar_colors(3,:),'MarkerFaceAlpha',.5,'displayname', 'CoefVar = 0.3');
scatter(score([31:40,71:80,111:120,151:160],1), yValue([31:40,71:80,111:120,151:160]),100, 'filled','MarkerFaceColor',coefvar_colors(4,:),'MarkerFaceAlpha',.5,'displayname', 'Biological CoefVar');
yticks([1 2 3 4])
yticklabels({'All','Internode Length','Myelin Thickness','Periaxonal Space Width'})
xlabel(append("PC1 (",num2str(round(explained(1),2)), "%)"))
ylim([0 5])
grid on
legend('Location','southoutside')
legend('boxoff')
hold off

%% Correlations
value_cv = [all_CV(:,1); all_CV(:,2); all_CV(:,3); all_CV(:,4)
    inode_CV(:,1); inode_CV(:,2); inode_CV(:,3); inode_CV(:,4);
    myelin_CV(:,1); myelin_CV(:,2); myelin_CV(:,3); myelin_CV(:,4);
    peri_CV(:,1); peri_CV(:,2); peri_CV(:,3); peri_CV(:,4)];

value_height = [all_peakSize(:,1); all_peakSize(:,2); all_peakSize(:,3);  all_peakSize(:,4)
    inode_peakSize(:,1); inode_peakSize(:,2); inode_peakSize(:,3); inode_peakSize(:,4);
    myelin_peakSize(:,1); myelin_peakSize(:,2); myelin_peakSize(:,3); myelin_peakSize(:,4);
    peri_peakSize(:,1); peri_peakSize(:,2); peri_peakSize(:,3); peri_peakSize(:,4)];


value_sd = [all_sd(:,1); all_sd(:,2); all_sd(:,3); all_sd(:,4)
    inode_sd(:,1); inode_sd(:,2); inode_sd(:,3); inode_sd(:,4);
    myelin_sd(:,1); myelin_sd(:,2); myelin_sd(:,3); myelin_sd(:,4);
    peri_sd(:,1); peri_sd(:,2); peri_sd(:,3); peri_sd(:,4)];

class_all = [repmat(1,40,1);
    repmat(0,40,1);
    repmat(0,40,1);
    repmat(0,40,1)];
class_inode = [repmat(0,40,1);
    repmat(1,40,1);
    repmat(0,40,1);
    repmat(0,40,1)];
class_myelin = [repmat(0,40,1);
    repmat(0,40,1);
    repmat(1,40,1);
    repmat(0,40,1)];
class_peri = [repmat(0,40,1);
    repmat(0,40,1);
    repmat(0,40,1);
    repmat(1,40,1)];


correlations = [score(:,1:2), value_cv, value_height, value_sd, class_all, class_inode,class_myelin, class_peri];
r = corrcoef(correlations);

% labels
labels = ["PC1 (75.21%)     ",...
    "PC2 (12.19%)     ",...
    "Conduction Velocity     ",...
    "Average voltage peak value     ",... 
    "SD of voltage peak values     ",...
    "Class: All     ",...
    "Class: Internode length     ",...
    "Class: Myelin thickness     ",...
    "Class: Peri. space width     ",];
% scatter plot
n = size(r, 1);
y = triu(repmat(n+1, n, n) - (1:n)') + 0.5;
x = triu(repmat(1:n, n, 1)) + 0.5;
x(x == 0.5) = NaN;
scatter(x(:), y(:), 400.*abs(r(:)), r(:), 'filled')
% enclose markers in a grid
xl = [1:n+1;repmat(n+1, 1, n+1)];
xl = [xl(:, 1), xl(:, 1:end-1)];
yl = repmat(n+1:-1:1, 2, 1);
line(xl, yl, 'color', 'k') % horizontal lines
line(yl, xl, 'color', 'k') % vertical lines
% show labels
text(1:n, (n:-1:1) + 0.5, labels, 'HorizontalAlignment', 'right')
text((1:n) + 0.5, repmat(n + 1, n, 1), labels, ...
    'HorizontalAlignment', 'right', 'Rotation', 270)
h = gca;
colorbar(h);
caxis([-1, 1]);
h.Visible = 'off';
h.Position(4) = h.Position(4)*0.9;
axis(h, 'equal')
colormap()

% %%
% time = 0:0.00005:2;
% peaks = zeros(1,size(AP_constant,2));
% width = zeros(1,size(AP_constant,2));
% for i = 1:size(AP_constant,2)
%     peaks(i) = max(AP_constant(:,i));
%     loc = find((AP_constant(:,i) < 0.499*(peaks(i)-72))&(AP_constant(:,i) > 0.501*(peaks(i)-72)));
%     width(i) = time(loc(end)) - time(loc(1));
% end
% avg_peakSize = mean(peaks);
% avg_width = mean(width);
% peak_width_ratio = mean(peaks./width);
% 
% %%
% [avg_peakSize1, avg_width1, peak_width_ratio1] = peak_width(AP_peri);
%%
bar(explained(1:10),'FaceColor',coefvar_colors(3,:),'LineWidth',1)
ylabel("Percentage of variance explained")
xlabel("Principal component")
title('C.','FontSize',14)
ax = gca;
ax.TitleHorizontalAlignment = 'left';
%%
AP = AP_myelin{1,1};
time = 0:0.00005:2;
plot(time,AP(:,[1,10,21]),'LineWidth',3)
%grid on
xlabel("Time (ms)")
ylabel("Axon voltage (mV)")
set(gca,'linewidth',2,'fontsize',16)

% for i = 1:size(AP_myelin,2)
%     plot(time,AP_myelin(:,i))
%     hold on
% end
% hold off
