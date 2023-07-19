function [y] = medFilterBL(sig, R)
    
    % 若未输入R，则默认R为501
    if (nargin < 2)
        R = 501;
    end

    y = sig;

    for i = 1:length(sig)
        if ((i+R)<=length(sig) && (i-R)>=1)
            temp = median(sig((i-R):(i+R)));
        elseif ((i+R)<=length(sig) && (i-R)<1)
            temp = median(sig(1:(i+R)));
        elseif ((i+R)>length(sig) && (i-R)>=1)
            temp = median(sig((i-R):end));
        end
    y(i)=y(i)-temp;
    end

end

% R为所选数据点的邻域半径，窗长为n=2R+1,n<L
% L=length(sig)
