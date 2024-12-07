clear,clc;

% This is a code for running the test set data

% data = readtable(fixed_image_lab.xlsx, 'Sheet', 1);
load("data.mat")

CV = [];                                                                   % Store volume
CA1 = [];                                                                  % Store surface area
CA2 = [];
Th = [];                                                                   % Store length and width
num = [];

for i = 1:length(data.LWR)
    w = data.Width(i);
    h = data.Height(i);

    num = [num; i];
    [CV1,CA11,CA21,len_pre1,wid_pre1] = Calvolume(w, h);
    [CV2,CA12,CA22,~,~] = Po_fun(w, h);                                    % Since the length-width estimation algorithm is the same, 
    [CV3,CA13,CA23,~,~] = Geo_fun(w,h);                                    % the following parameters are omitted
    [CV4,CA14,CA24,~,~] = Ter_fun(w, h);
    [CV5,CA15,CA25,~,~] = Bin_fun(w, h);
    CV = [CV;CV1 CV2 CV3 CV4 CV5];                                         % Calculation results of all volume models
    CA1 = [CA1;CA11 CA12 CA13 CA14 CA15];                                  % Results of surface area model 1 under different volumes
    CA2 = [CA2;CA21 CA22 CA23 CA24 CA25];                                  % Results of surface area model 2 under different volumes
    Th = [Th;len_pre1 wid_pre1];

end
T_CV = table(num, CV(:,1), CV(:,2), CV(:,3), CV(:,4), CV(:,5), ...
    'VariableNames', {'FileJ', 'CV1', 'CV2', 'CV3', 'CV4', 'CV5'});
T_CA1 = table(num, CA1(:,1), CA1(:,2), CA1(:,3), CA1(:,4), CA1(:,5), ...
    'VariableNames', {'FileJ', 'CA11', 'CA12', 'CA13', 'CA14', 'CA15'});
T_CA2 = table(num, CA2(:,1), CA2(:,2), CA2(:,3), CA2(:,4), CA2(:,5), ...
    'VariableNames', {'FileJ', 'CA21', 'CA22', 'CA23', 'CA24', 'CA25'});
T_Th = table(num, Th(:,1), Th(:,2), ...
    'VariableNames', {'FileJ', 'LengthPre1', 'WidPre1'});

filename = 'D:\Rproject\Consistency_plot\testmodeling.xlsx';
writetable(T_CV, filename, 'Sheet',1);
writetable(T_CA1, filename, 'Sheet',2);
writetable(T_CA2, filename, 'Sheet',3);
writetable(T_Th, filename, 'Sheet',4);

