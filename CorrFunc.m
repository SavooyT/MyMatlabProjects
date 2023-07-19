function [Correlation] = CorrFunc(IIData,V5Data,L,Freq)

    % 信号傅立叶变换
    iiFFT01=fft(IIData);
    v5FFT01=fft(V5Data);

    % 取左半部分有实际意义的值
    iiFFT=iiFFT01(1:L/2+1);
    v5FFT=v5FFT01(1:L/2+1);

    % 处理掉右边没有物理意义的值；
    iiFFT(2:end-1)=2*iiFFT(2:end-1);
    v5FFT(2:end-1)=2*v5FFT(2:end-1);

    % 信号自功率谱
    Gii=iiFFT.*conj(iiFFT);
    Gv5=v5FFT.*conj(v5FFT);

    % 信号互功率谱
    Gxy=iiFFT.*conj(v5FFT);

    % 相关性
    temp01=sqrt(Gxy.*Gxy);
    temp02=sqrt(Gii.*Gv5);
    Correlation=real(temp01./temp02);

    % 画图
    plot(Freq,Correlation);xlim([0 25]);ylim([0 1]);
    xlabel('Frequency (Hz)');ylabel('Correlation Coefficient');
    title('Correlation Coefficients of II & V5 Signals');

end