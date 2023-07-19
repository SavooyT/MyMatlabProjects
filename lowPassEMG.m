function Hd = lowPassEMG
%LOWPASS 返回离散时间滤波器对象。

% Generated on: 06-Oct-2022 21:37:05

% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

Fpass = 25;          % Passband Frequency
Fstop = 100;          % Stopband Frequency
Apass = 1;           % Passband Ripple (dB)
Astop = 100;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
