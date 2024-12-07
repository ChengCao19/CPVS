function [CV,CA1,CA2,len_pre,wid_pre] = Calvolume(len,wid)
% This function aim to calculate boll morphological characteristics
if len <= 0 || wid <= 0
    error('Length and width must be positive numbers.');
end
if len < wid
    tra = wid;
    wid = len;
    len = tra;
end

% SP estimation
sf = (1-wid/len)./(sqrt(1-(wid^2/len^2)));

% L-W estimationg
len_pre = 0.007*len-0.018;
wid_pre = 0.006*wid+0.252;

% Three sections, starting with 0.
    if sf >= 0 && sf <= 0.349
        %CV = (2.1-0.2*wid_pre^2./len_pre^2)^(-1)*(len_pre*wid_pre^2);
        %CV = 0.514*len_pre*wid_pre^2;
        CV = 0.5*len_pre*wid_pre.^2;
    elseif sf > 0.349 && sf <= 0.445
        CV = 0.49*len_pre*wid_pre^2;
    elseif sf > 0.445 && sf < 0.635
        CV = 0.47*len_pre*wid_pre^2;
    else
        error('Parameter value is not in valid range!');
    end
CA1 = Pmu_fun(CV);
CA2 = Ls_fun(CV);
end