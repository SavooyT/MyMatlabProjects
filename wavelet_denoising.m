function denoised_signal = wavelet_denoising(signal, wavelet_name, level, thresholding_method, threshold)

% 小波去噪函数
% 输入参数：
% signal：原始信号，一维向量
% wavelet_name：小波基名称，如 'db4'
% level：小波分解层数，建议 4-6 层
% thresholding_method：阈值处理方法，如 'soft' 或 'hard'
% threshold：阈值，建议 2-3 * std(signal)

% 小波分解
[c, l] = wavedec(signal, level, wavelet_name);

% 阈值处理
switch thresholding_method
    case 'soft'
        c = sign(c) .* max(abs(c) - threshold, 0);
    case 'hard'
        c = (abs(c) >= threshold) .* c;
end

% 小波重构
denoised_signal = waverec(c, l, wavelet_name);
end
