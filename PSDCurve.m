function [iiPSD,v5PSD]=PSDCurve(IIData,V5Data,L,Fs)

    % 加窗
    window=blackman(L);

    % 功率谱
    [iiPSD,fii]=periodogram(IIData,window,L,Fs);
    [v5PSD,fv5]=periodogram(V5Data,window,L,Fs);    

%     % 画图01
%     figure;
% 
%     % ii
%     subplot(221);plot(fii,iiPSD);xlim([0 max(fii)]);
%     xlabel("Frequency (Hz)");
%     ylabel("Power/Frequency ((mV)^2/Hz)");
%     title("Power Spectrum of II Signals");
% 
%     subplot(222);plot(fii,iiPSD);xlim([0 25]);
%     xlabel("Frequency (Hz)");
%     ylabel("Power/Frequency ((mV)^2/Hz)");
%     title("Power Spectrum of II Signals");
% 
%     % v5
%     subplot(223);plot(fv5,v5PSD);xlim([0 max(fv5)]);
%     xlabel("Frequency (Hz)");
%     ylabel("Power/Frequency ((mV)^2/Hz)");
%     title("Power Spectrum of V5 Signals");
% 
%     subplot(224);plot(fv5,v5PSD);xlim([0 25]);
%     xlabel("Frequency (Hz)");
%     ylabel("Power/Frequency ((mV)^2/Hz)");
%     title("Power Spectrum of V5 Signals");

    % 画图02
%     figure;
%     plot(fii,iiPSD,fv5,v5PSD,'-.');
%     xlabel("Frequency (Hz)");xlim([0 25]);
%     ylabel("Power/Frequency ((mV)^2/Hz)");
%     title("Power Spectrum of Both II & V5 Signals");
%     legend('II Signals','V5 Signals');

    % 寻找局部极值
    figure;
    findpeaks(iiPSD,fii,'MinPeakDistance',1);
    hold on;
    findpeaks(v5PSD,fv5,'MinPeakDistance',1);
    xlabel("Frequency (Hz)");xlim([0 25]);
    ylabel("Power/Frequency ((mV)^2/Hz)");
    title("Power Spectrum of Both II & V5 Signals");
    legend('II Signals','','V5 Signals','');



    

    
    








end