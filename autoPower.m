function [APII,APV5] = autoPower(IIDATA,V5DATA,L)
%AUTOPOWER 自功率谱

% 傅立叶变换
IIFFT=fft(IIDATA);
V5FFT=fft(V5DATA);

% 求共轭
IICONJ=conj(IIDATA);
V5CONJ=conj(V5DATA);

% 归一化的自功率谱
APII=(IIFFT.*IICONJ)/L;
APV5=(V5FFT.*V5CONJ)/L;

end

