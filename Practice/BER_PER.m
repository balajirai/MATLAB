% BER PER
clc, clearvars, close all;

% Parameters
SNRdB = 0:2:20; % Signal-to-Noise Ratio (in dB)
nBits = 1e6;    % Number of transmitted bits

% Initialize variables to store results
BER = zeros(size(SNRdB));
PER = zeros(size(SNRdB));
Capacity = zeros(size(SNRdB));
Throughput = zeros(size(SNRdB));

for i = 1:length(SNRdB)
    % Generate random bits to transmit
    txBits = randi([0, 1], 1, nBits);
    
    % Modulate the bits using BPSK
    txSymbols = 2 * txBits - 1; % BPSK modulation
    
    % Add AWGN to simulate the channel
    snr = 10^(SNRdB(i)/10); % Calculate SNR from dB
    noisePower = 1 / snr;
    noise = sqrt(noisePower) * randn(size(txSymbols));
    rxSymbols = txSymbols + noise;
    
    % Demodulate received symbols
    rxBits = rxSymbols > 0; % BPSK demodulation
    
    % Calculate BER and PER
    bitErrors = sum(rxBits ~= txBits);
    packetErrors = sum(rxBits(1:nBits) ~= txBits(1:nBits));
    BER(i) = bitErrors / nBits;
    PER(i) = packetErrors / nBits;
    
    % Calculate channel capacity (Shannon capacity formula)
    Capacity(i) = log2(1 + snr);
    
    % Calculate throughput (bits per second)
    Throughput(i) = nBits / (1 + PER(i));
end

% Plot results
figure;
subplot(2, 2, 1);
semilogy(SNRdB, BER);
title('Bit Error Rate (BER) vs. SNR');
xlabel('SNR (dB)');
ylabel('BER');

subplot(2, 2, 2);
semilogy(SNRdB, PER);
title('Packet Error Rate (PER) vs. SNR');
xlabel('SNR (dB)');
ylabel('PER');

subplot(2, 2, 3);
plot(SNRdB, Capacity);
title('Channel Capacity vs. SNR');
xlabel('SNR (dB)');
ylabel('Capacity (bits/symbol)');

subplot(2, 2, 4);
plot(SNRdB, Throughput);
title('Throughput vs. SNR');
xlabel('SNR (dB)');
ylabel('Throughput (bits/second)');