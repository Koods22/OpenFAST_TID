function [S_meg,f] = FFT_OpenFAST(File, dt, Param)

data = ReadFASTtext(File, '',8,7,8);
fs = 1/dt; %Sample frequency Hz
duration = data(length(data),1); %Last value in time
N = fs * duration;
Ts = data(:,Param);
S = fft(Ts);
S_oneSide = S(1:N/2);
f = fs*(0:N/2-1)/N;
S_meg = abs(S_oneSide)/(N/2);

return;