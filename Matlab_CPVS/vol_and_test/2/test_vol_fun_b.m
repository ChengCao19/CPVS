clear,clc;
% This file is used to varify vol_fun_c.m

%% Call data and perform calculations

datafilename = '111shuju.xlsx';              % Data file and its name
sheetname = 2;
data = readtable(datafilename,"Sheet",sheetname);

MSE = [];                                    % series of error
RMSE = [];
MAE = [];
MAPE = [];
Rs = [];
ARs = [];
for num = 1:7                                % Range of "num" is from 1 to 9, inclusive integers
    T_P = [];
    E_P = [];
    E_P2 = [];                               % Store total sum of squares
    O_P = [];
    EP_P = [];
    
    for i = 1:height(data)
        len = data.length(i);                % Length
        wid = data.width(i);                 % Width
        [CV] = vol_fun_b(len,wid,num);       % Acquire Cotton boll volume
        error = abs(CV - data.volume(i));    % Calculation error
        error2 = abs(data.volume(i)-mean(data.volume));
                                             % Calculate error2
        error_percentage = error./data.volume(i);
                                             % Percentage of error
        T_P = [T_P;CV];
        E_P = [E_P;error];
        E_P2 = [E_P2;error2];
        O_P = [O_P;data.volume(i)];
        EP_P = [EP_P;error_percentage];
    end
    E_P_table = array2table(E_P, 'VariableNames', {'Error'});
    E_P2_table = array2table(E_P2, 'VariableNames', {'Error2'});
    T_P_table = array2table(T_P, 'VariableNames', {'CV'});
    O_P_table = array2table(O_P, 'VariableNames', {'Ori'});
    EP_P_table = array2table(EP_P, 'VariableNames', {'Ep'});
                                             % mean square error ahd its root
    mse = (1/height(data))*sum(E_P_table.Error.^2);
    rmse = sqrt(mse);
    mae = (1/height(data))*sum(E_P_table.Error);
    mape = (1/height(data))*sum(EP_P_table.Ep);
    rs = 1-(sum(E_P_table.Error.^2)./sum(E_P2_table.Error2.^2));
    ars = 1-(((1-rs)*(height(data)-1))/(height(data)-2-1));

    MSE = [MSE;mse];
    RMSE = [RMSE;rmse];
    MAE = [MAE;mae];
    MAPE = [MAPE;mape];
    Rs = [Rs;rs];
    ARs = [ARs;ars];

    combined_T_E_P = [T_P_table, E_P_table, O_P_table,EP_P_table];
%% Update the foler automatically

%     filefolder = "D:\Rproject\line_chart\#";
%     [folderPath, lastFolder] = fileparts(filefolder);
%     newLastFolder = num2str(num);
%     newFilefolder = fullfile(folderPath, newLastFolder);
    baseFolder = "D:\Rproject\line_chart_of_Volume_formulation\line_chart2\#";
    folderName = sprintf('%02d', num); 
    newFilefolder = strrep(baseFolder, "#", folderName); 

    if ~isfolder(newFilefolder)              % If the folder does not exist
        mkdir(newFilefolder);                % Create a folder automatically
    end
    filename = sprintf('E_P_and_T_P_%02d.xlsx', num);
                                             % Dynamic file name
    fullpath = fullfile(newFilefolder, filename);
                                             % Create a file path
    writetable(combined_T_E_P, fullpath);
end
MSE_table = array2table(MSE, 'VariableNames', {'MSE'});
RMSE_table = array2table(RMSE, 'VariableNames', {'RMSE'});
MAE_table = array2table(MAE, 'VariableNames', {'MAE'});
MAPE_table = array2table(MAPE, 'VariableNames', {'MAPE'});
Rs_table = array2table(Rs, 'VariableNames', {'Rs'});
ARs_table = array2table(ARs, 'VariableNames', {'ARs'});

combined_Ep = [MSE_table, RMSE_table, MAE_table, MAPE_table,Rs_table,ARs_table];

efolder = "D:\Rproject\line_chart_of_Volume_formulation\line_chart2\Ep.xlsx";
writetable(combined_Ep, efolder);

