function newSig = smoothSG(rawSig)
% M点P阶2次插值滤波法，用于去毛刺

M=5;   % M为窗口长度
P=3;   % P为拟合阶数

m=length(rawSig);
N_window=M;                 % 窗口长度
b=sgolay(P, N_window);
F_SG=b((N_window+1)/2,:);   % 5点3阶插值
newSig=rawSig;

for k=1:2
    % 镜像延拓
    tmp=wextend(1,'sym',newSig,(N_window-1)/2);
    % 利用卷积的方法计算
    tmp=conv(tmp,F_SG,'same');    
    % 中间截断
    newSig=wkeep1(tmp,m);           
end


