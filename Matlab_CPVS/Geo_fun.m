function [CV,CA1,CA2,len_pre,wid_pre] = Geo_fun(len,wid)
% This function is a geomatic model for calculating the volumes of cotton bolls
if len <= 0 || wid <= 0
    error('Length and width must be positive numbers.');
end
if len < wid
    tra = wid;
    wid = len;
    len = tra;
end
LWR = round(len/wid,1);
len_pre = 0.007*len-0.018;
wid_pre = 0.006*wid+0.252;
GA = [1.2  1 0.9918;
      1.3  0 0.9962;
      1.4  0 0.9728;
      1.5 -1 0.9759;
      1.6 -2 0.9841;
      1.7 -3 0.9866;
      1.8 -4 0.9611;
      1.9 -5 0.9972;
      2.0 -6 0.9969;
      2.1 -7 0.9978;
      2.2 -8 0.9978];
% 查找与GA第一列某一行的值相等的行
row_indices = find(ismember(GA(:,1), LWR));
    if ~isempty(row_indices)                                               % If a matching line is found
        row_index = row_indices(1);                                        % Get the first matching line
        n = GA(row_index, 2);                                              % Get the value of the second column of the corresponding row
        CV = 0.5*len_pre*wid_pre^2+0.0125*n*wid_pre^3;                     % Calculate CV     
    else
        CV = 0;
        disp('The CV is empty!');                                          % No matching rows, returns 0.
    end
CA1 = Pmu_fun(CV);
CA2 = Ls_fun(CV);
end
