function [CV,CA1,CA2,len_pre,wid_pre] = Po_fun(len,wid)
% This function is a power function model for calculating the volume of cotton bolls
if len <= 0 || wid <= 0
    error('Length and width must be positive numbers.');
end
if len < wid
    tra = wid;
    wid = len;
    len = tra;
end
LWR = round(len/wid);
len_pre = 0.007*len - 0.018;
wid_pre = 0.006*wid + 0.252;
PA = [1.0 1.1627 2.4160 0.9544; 
      1.1 1.1387 2.4349 0.9517;
      1.2 0.5371 3.1058 0.9917;                                            % PA matrix 
      1.3 0.8632 2.7689 0.9918;
      1.4 0.8077 2.8719 0.9847;
      1.5 0.6013 3.1641 0.9760;
      1.6 1.0717 2.7193 0.9815;
      1.7 1.2280 2.6278 0.9832;
      1.8 1.6091 2.4182 0.9713;
      1.9 0.6667 3.3091 0.9969;
      2.0 0.5485 3.4510 0.9649;
      2.1 1.1516 2.8636 0.9938;
      2.2 1.1516 2.8636 0.9938;
      2.3 1.1516 2.8636 0.9938];
                                                                           % Find a row that is equal to the value of a row in the first column of PA
row_indices = find(ismember(PA(:,1), LWR));
    if ~isempty(row_indices)                                               % If a matching line is found
        row_index = row_indices(1);                                        % Get the first matching line
        A = PA(row_index, 2);                                              % Get the values of the second and third columns of the corresponding row
        B = PA(row_index, 3);
        CV = A * wid_pre^B;                                                % calculate CV      
    else
        CV = 0;
        disp('The CV is empty!');                                          % If no matching rows are found, the CV is set to NaN.
    end
CA1 = Pmu_fun(CV);
CA2 = Ls_fun(CV);
end
