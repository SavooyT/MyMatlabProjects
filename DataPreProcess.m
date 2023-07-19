% 本函数用于数据导入以及初始化采样率、频率和数据长度
function [IIData, V5Data, L, Fs, Freq] = DataPreProcess(iiRaw, v5Raw)

    % 定义采样率 Fs
    Fs=1000;
    
    % 削减数据长度
    IITemp=iiRaw(149:length(iiRaw));
    V5Temp=v5Raw(149:length(v5Raw));
    
    % 测算处理后数据的长度
    L=length(IITemp);
    
    % 定义处理后数据所具有的频率范围(单边谱)
    Freq=Fs*(0:(L/2))/L;

    R1=501;
    R2=17;

    % 低通滤波去肌电噪声
    IIData=filter(lowPassEMG,IITemp);
    V5Data=filter(lowPassEMG,V5Temp);
    
    % 平均中值滤波去基线漂移
    IIData=medFilterBL(IIData, R1);
    V5Data=medFilterBL(V5Data, R1);

    % 滑动平均滤波去毛刺
    IIData=movAvgFilter(IIData, R2);
    V5Data=movAvgFilter(V5Data, R2);

    % 画图
    figure;

    % ii
    subplot(221);plot(IITemp);
    title("II Raw vs Filted Signals");
    xlabel("Sampling Point");xlim([0 L]);
    ylabel("Voltage (mV)");hold on;plot(IIData);
    ylim([-0.3 1.5]);legend('Raw','Filted');
    
    subplot(222);plot(IIData);title("II Filted Signals");
    xlabel("Sampling Point");xlim([0 L]);ylabel("Voltage (mV)");

    % v5
    subplot(223);plot(V5Temp);
    title("V5 Raw vs Filted Signals");
    xlabel("Sampling Point");xlim([0 L]);
    ylabel("Voltage (mV)");hold on;plot(V5Data);
    ylim([-0.7 3]);legend('Raw','Filted');

    subplot(224);plot(V5Data);title("V5 Filted Signals");
    xlabel("Sampling Point");xlim([0 L]);ylabel("Voltage (mV)");
end
