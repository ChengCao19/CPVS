clear,clc;
% This file is used to varify Po_fun.m
filename = '111shuju.xlsx';
sheetname = 2;
data = readtable(filename,"Sheet",sheetname);
T_P = [];
E_P = [];
for i = 1:height(data)
    length = data.length_1(i);           % Length
    width = data.width_1(i);             % Width
    [LWR,CV] = Po_fun(length,width);     % Acquire LWR and Cotton boll volume
    error = abs(CV - data.volume_1(i));  % Calculation error
    E_P = [E_P;error];
    T_P = [T_P;[LWR,CV]];
end
E_P_table = array2table(E_P, 'VariableNames', {'Error'});
T_P_table = array2table(T_P, 'VariableNames', {'LWR', 'CV'});
combined_T_E_P = [T_P_table, E_P_table];
filefoder = "D:\Rproject\line_chart";
filename = 'E_P_and_T_P.xlsx';           % 文件名
fullpath = fullfile(filefoder, filename);
writetable(combined_T_E_P, fullpath);    % 写入文件

