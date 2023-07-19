function [peak_ii,locs_pkii,peak_v5,locs_pkv5]=PTest(IIData,V5Data,L,Freq)
    
    % 信号傅立叶变换
    iiFFT01=fft(IIData);
    v5FFT01=fft(V5Data);

    % 取左半部分有实际意义的值
    iiFFT=iiFFT01(1:L/2+1);
    v5FFT=v5FFT01(1:L/2+1);

    % 处理掉右边没有物理意义的值；
    iiFFT(2:end-1)=2*iiFFT(2:end-1);
    v5FFT(2:end-1)=2*v5FFT(2:end-1);

    % 归一化信号自功率谱
    Gii=(iiFFT.*conj(iiFFT))/(length(iiFFT)^2);
    Gv5=(v5FFT.*conj(v5FFT))/(length(v5FFT)^2);

    % 将过于小的值置零
%     for i=1:length(Gii)
%         if (Gii(i)<=(max(Gii)/12))
%             Gii(i)=0;
%         end
%     end
% 
%     for i=1:length(Gv5)
%         if (Gv5(i)<=(max(Gv5)/12))
%             Gv5(i)=0;
%         end
%     end

    % 检测局部峰值
    [peak_ii,locs_pkii]=findpeaks(Gii,Freq,'MinPeakDistance',1);
    [peak_v5,locs_pkv5]=findpeaks(Gv5,Freq,'MinPeakDistance',1);

    % 各只取前16个峰值
    peak_ii=peak_ii(1:16);
    peak_v5=peak_v5(1:16);

    % 各只取前16个峰值的x轴位置
    locs_pkii=locs_pkii(1:16);
    locs_pkv5=locs_pkv5(1:16);

    % 画图
    figure;
    findpeaks(Gii,Freq,'MinPeakDistance',1);
    hold on;
    findpeaks(Gv5,Freq,'MinPeakDistance',1);
    text(locs_pkv5,peak_v5,num2str((1:numel(peak_v5))'));
    xlabel("Frequency (Hz)");
    xlim([0 25]);ylim([0 max(Gv5)*1.1]);
    ylabel("Power/Frequency ((mV)^2/Hz)");
    title("AutoPower of Both II & V5 Signals");
    legend('II Signals','','V5 Signals','');
    
    if (peak_ii(1)/peak_ii(2)<0.9)
        disp("II信号1/2异常");
    else
        disp("II信号1/2正常");
    end

    if (peak_v5(1)/peak_v5(2)<0.85)
        disp("V5信号1/2异常");
    else
        disp("V5信号1/2正常");
    end
    
    if (peak_ii(1)<0.02)
        disp("II信号1-N值异常");
    else
        disp("II信号1-N值正常");
    end

    if (peak_v5(1)<0.02)
        disp("V5信号1-N值异常");
    else
        disp("V5信号1-N值正常");
    end
end