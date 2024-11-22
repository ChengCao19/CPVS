function [CV] = evm(len,wid)
% This function aim to calculate boll volume
if len <= 0 || wid <= 0
    error('Length and width must be positive numbers.');
end
if len < wid
    tra = wid;
    wid = len;
    len = tra;
end

sf = (1-wid/len)./(sqrt(1-(wid^2/len^2)));

% 分三段，从0开始
    if sf >= 0 && sf <= 0.349
        %CV = (2.1-0.2*wid_pre^2./len_pre^2)^(-1)*(len_pre*wid_pre^2);
        %CV = 0.514*len_pre*wid_pre^2;
        CV = 0.5*len*wid.^2;
    elseif sf > 0.349 && sf <= 0.445
        CV = 0.49*len*wid.^2;
    elseif sf > 0.445 && sf < 0.635
        CV = 0.47*len*wid.^2;
    else
        error('Parameter value is not in valid range!');
    end














end