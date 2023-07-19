function y = harmonicSignal(f0, harmonics, t)
% 生成包含谐波成分的正弦信号
% f0：基波频率
% harmonics：谐波幅值递减系数，是一个1xn数组，n表示谐波的数量
% t：时间向量

% 生成基波信号
y = sin(2*pi*f0*t);

% 生成谐波信号
for i = 1:length(harmonics)
    harmonic = sin(2*pi*i*f0*t);
    y = y + harmonics(i)*harmonic;
end
end
