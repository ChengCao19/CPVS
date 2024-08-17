function [CV,CA1,CA2,len_pre,wid_pre] = Ter_fun(len, wid)
% This function is a Ternary regression model for calculate volume.
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

TA = [1.2 -47.78 0.43 21.01 0.9680;
      1.3 -26.16 4.20 10.33 0.9917;
      1.4 -36.78 0.10 18.81 0.9967;
      1.5 -52.68 4.73 16.95 0.9978;
      1.6 -43.84 11.72 3.88 0.9963;
      1.7 -42.78 8.81  6.83 0.9910;
      1.8 -28.19 0.34 16.44 0.9535;
      1.9 -42.82 8.18  7.27 0.9989;
      2.0 -53.51 7.49 11.18 0.9532;
      2.1 -53.51 7.49 11.18 0.9532;
      2.2 -53.51 7.49 11.18 0.9532];

row_indices = find(ismember(TA(:,1), LWR));
    if ~isempty(row_indices)                                               % 如果找到匹配的行
        row_index = row_indices(1);                                        % 取第一个匹配的行
        a = TA(row_index, 2);                                              % 获取对应行的第二列的值
        b1 = TA(row_index, 3);
        b2 = TA(row_index, 4);
        CV = a + b1*len_pre + b2*wid_pre;                     % 计算CV      
    else
        CV = 0;
        disp('The CV is empty!');                                          % 无匹配的行，返回0
    end
CA1 = Pmu_fun(CV);
CA2 = Ls_fun(CV);
end