close all; clear all; clc

[S_meg,f] = FFT_OpenFAST('StC_test_OC4Semi.out',0.0125,16);

figure(1)
plot(f, S_meg)
xlabel('Frequency (Hz)')
ylabel('Amplitude')
xlim([0 0.1])