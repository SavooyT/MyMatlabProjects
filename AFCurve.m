function [iiAF,v5AF] = AFCurve(iiData,v5Data,L,Freq)

    % 对信号傅立叶变换
    iiFFT=fft(iiData);
    v5FFT=fft(v5Data);
    % 归一化，保证幅值不失真
    iiY1=abs(iiFFT/L);
    v5Y1=abs(v5FFT/L);
    % 取左半部分有实际意义的实频
    iiAF=iiY1(1:L/2+1);
    v5AF=v5Y1(1:L/2+1);
    % 处理掉右边没有物理意义的虚频；
    iiAF(2:end-1)=2*iiAF(2:end-1);
    v5AF(2:end-1)=2*v5AF(2:end-1);

    % 画图
    figure;
    
    % ii
    subplot(221);plot(Freq,iiAF);xlim([0 max(Freq)]);
    xlabel("Frequency (Hz)");ylabel("Magnitude (mV)");
    title("Single-Side Amplitude Spectrum of II Signals");

    subplot(222);plot(Freq,iiAF);xlim([0 35]);
    xlabel("Frequency (Hz)");ylabel("Magnitude (mV)");
    title("Single-Side Amplitude Spectrum of II Signals");

    % v5
    subplot(223);plot(Freq,v5AF);xlim([0 max(Freq)]);
    xlabel("Frequency (Hz)");ylabel("Magnitude (mV)");
    title("Single-Side Amplitude Spectrum of V5 Signals");
    
    subplot(224);plot(Freq,v5AF);xlim([0 35]);
    xlabel("Frequency (Hz)");ylabel("Magnitude (mV)");
    title("Single-Side Amplitude Spectrum of V5 Signals");

end