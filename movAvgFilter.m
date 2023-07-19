function x1 = movAvgFilter(sig,win_sz)
    % sig:待滑动平均的数据
    % win_sz：窗宽

    % 若未输入win_sz，则默认win_sz为17
    if (nargin < 2)
        win_sz = 17;
    end
    
    L = length(sig); %数据长度
    x1 = zeros(L,1); %平均之后的数据
    
    half_win = ceil(win_sz/2);
    half_win_ = floor(win_sz/2);
    if half_win==half_win_
        half_win = half_win+1;
    end
    
    x1(1:half_win) = sig(1:half_win);
    x1(L-half_win:L) = sig(L-half_win:L);
    
    temp=zeros(1,1);
    for i = half_win:L-half_win
        k=0;
        for j = i-half_win_:i+half_win_  %对第i个窗里面的数求平均
            k = k+1;
            temp(k) = sig(j) ; %临时存储第i个窗的数据
        end
        x1(i) = mean(temp); %第i个窗里面的平均值给第i个数
    end
end
