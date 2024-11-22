function [CV] = Geo_fun(len,wid)
% This function is a geomatic model for calculating the volumes of cotton bolls
if len <= 0 || wid <= 0
    error('Length and width must be positive numbers.');
end
if len < wid
    tra = wid;
    wid = len;
    len = tra;
end
LWR = round(len/wid);
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
    if ~isempty(row_indices)                                               % 如果找到匹配的行
        row_index = row_indices(1);                                        % 取第一个匹配的行
        n = GA(row_index, 2);                                              % 获取对应行的第二列的值
        CV = 0.5*len_pre*wid_pre^2+0.0125*n*wid_pre^3;                     % 计算CV      
    else
        CV = 0;
        disp('The CV is empty!');                                          % 无匹配的行，返回0
    end
end

