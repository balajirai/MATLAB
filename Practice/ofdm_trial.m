clc, clearvars, close all;

M = 4;
nfft = 8;
cplen = 4;
nSym = 2;

% Radom data symbol
data = randi([0 M-1], nfft, nSym);

% Modulation
qam = qammod(data, M);
ofdm = ofdmmod(qam, nfft, cplen);

scatter(real(ofdm), imag(ofdm));
title("Scatter Plot of 16QAM OFDM");

% Demodulation
ofdmd = ofdmdemod(ofdm, nfft, cplen);
qamd = qamdemod(ofdmd, M);

isequal(qamd, data)

subplot(2,1,1);
plot(data);

subplot(2,1,2);
plot(qamd);
