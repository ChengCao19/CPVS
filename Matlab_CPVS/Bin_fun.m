function [CV,CA1,CA2,len_pre,wid_pre] = Bin_fun(len, wid)
% This function is a Binary regression
if len <= 0 || wid <= 0
    error('Length and width must be positive numbers.');
end
if len < wid
    tra = wid;
    wid = len;
    len = tra;
end
LWR = round(len/wid,1);
len_pre = 0.007*len - 0.018;
wid_pre = 0.006*wid + 0.252;

BA = [1.2 -47.64 21.49 0.9904;
      1.3 -25.80 15.72 0.9914;
      1.4 -36.76 18.94 0.9689;
      1.5 -52.09 23.89 0.9691;
      1.6 -43.74 21.78 0.9690;
      1.7 -37.21 19.87 0.9814;
      1.8 -27.97 16.97 0.9676;
      1.9 -56.48 27.34 0.9985;
      2.0 -60.00 28.33 0.9948;
      2.1 -48.84 25.70 0.9995;
      2.2 -48.84 25.70 0.9995];

row_indices = find(ismember(BA(:,1), LWR));
    if ~isempty(row_indices)                                               % 如果找到匹配的行
        row_index = row_indices(1);                                        % 取第一个匹配的行
        a = BA(row_index, 2);                                              % 获取对应行的第二列的值
        b = BA(row_index, 3);
        CV = a + b*wid_pre;                                                % 计算CV      
    else
        CV = 0;
        disp('The CV is empty!');                                          % 无匹配的行，返回0
    end
CA1 = Pmu_fun(CV);
CA2 = Ls_fun(CV);
end