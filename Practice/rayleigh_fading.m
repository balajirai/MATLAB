clc, clearvars, close all;

num_samples = 1000;
snr_dB = 20;
t = linspace(0, 1, num_samples);

transmitted_signal = sin(2 * pi * 10 * t);

% Generate a Rayleigh fading channel (complex Gaussian noise)
received_signal = transmitted_signal + sqrt(0.5 / 10^(snr_dB / 10)) * (randn(1, num_samples) + 1i * randn(1, num_samples));

subplot(2,1,1);
plot(t, abs(transmitted_signal), 'b-', 'LineWidth', 2, 'DisplayName', 'Transmitted Signal');
xlabel('Time');
ylabel('Amplitude');
hold on;

subplot(2,1,2);
plot(t, abs(received_signal), 'LineWidth', 2, 'DisplayName', 'Received Signal (with Rayleigh fading)');
xlabel('Time');
ylabel('Amplitude');
legend('Location', 'best');
grid on;
title('Transmitted and Received Signals with Rayleigh')