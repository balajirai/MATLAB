% Rayleigh inbuilt function
clc, clearvars, close all;

% Define the Rayleigh channel object
rayleighChannel = comm.RayleighChannel;

% Generate a sinusoidal input signal
fs = 1000; % Sampling frequency
t = 0:1/fs:1; % Time vector
f = 5; % Frequency of the sinusoidal signal
inputSignal = sin(2*pi*f*t);

% Apply the Rayleigh fading channel
outputSignal = rayleighChannel(inputSignal.');

% Plot the original and faded signals
figure;
subplot(2, 1, 1);
plot(t, inputSignal, 'b', 'LineWidth', 1.5);
title('Original Sinusoidal Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, outputSignal, 'r', 'LineWidth', 1.5);
title('Sinusoidal Signal after Rayleigh Fading');
xlabel('Time');
ylabel('Amplitude');