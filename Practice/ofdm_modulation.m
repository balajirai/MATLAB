clc;
clear;
close all;

M = 4;       % Modulation order for QAM -> tradeoff between error rate and data rate
nfft  = 8;   % Number of data carriers -> how close each point is to one other -> error vs spectral efficiency tradeoff 
cplen = 4;   % Cyclic prefix length -> gap between the sub carriers in f domain -> better separation - less ISI -> spectral efficiency vs ISI
nSym  = 2;   % Number of symbols per RE -> higher nSym, more symbols transmitted in same duration, higher symbol density -> ISI vs data rate

% (nSym * nfft) symbols in the scatter plot


% Generate random data symbols
data = randi([0 M-1], nfft, nSym);

% QAM modulation
qam = qammod(data, M);

% OFDM modulation
ofdm = ofdmmod(qam, nfft, cplen);

% Scatter plot of the 16QAM modulated symbols
scatter(real(ofdm), imag(ofdm));
title('Scatter Plot of 16QAM OFDM Modulated Symbols');

ofdm_demod = ofdmdemod(ofdm, nfft, cplen);
qam_demod = qamdemod(ofdm_demod, M);

isequal(qam_demod, data);

figure;
subplot(2, 1, 1);
plot(data, LineWidth=2);
title('Data Points');

subplot(2, 1, 2);
plot(qam_demod, LineWidth=2);
title('OFDM Demodulated Data Points');