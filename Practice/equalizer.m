clc;
clear;

% Simulation Parameters
Fs = 1000; % Sampling frequency (Hz)
t = 0:1/Fs:1; % Time vector (1 second)

% Generate a sine wave as the input signal
f = 10; % Frequency of the sine wave (Hz)
inputSignal = sin(2*pi*f*t);

% Simulate a channel with delay and noise
channelDelay = 5;
noisePower = 0.2;
distortedSignal = [zeros(1, channelDelay) inputSignal(1:end-channelDelay)] + noisePower * randn(1, length(t));

% Define the linear equalizer using zero-forcing
equalizedSignalZF = linearEqualizerZeroForcing(distortedSignal, channelDelay);

% Define the nonlinear equalizer using MLSE
equalizedSignalMLSE = nonlinearEqualizerMLSE(distortedSignal, channelDelay);

% Define the adaptive equalizer using LMS algorithm
equalizedSignalLMS = adaptiveEqualizer(distortedSignal, inputSignal, channelDelay);

% Plot the signals
figure;
subplot(5, 1, 1);
plot(t, inputSignal, 'r', 'DisplayName', 'Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Location', 'NorthEast');

subplot(5, 1, 2);
plot(t, distortedSignal, 'g', 'DisplayName', 'Distorted Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Location', 'NorthEast');

subplot(5, 1, 3);
plot(t, equalizedSignalZF, 'b', 'DisplayName', 'Linear Equalized (Zero-Forcing)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Location', 'NorthEast');

subplot(5, 1, 4);
plot(t, equalizedSignalMLSE, 'm', 'DisplayName', 'Nonlinear Equalized (MLSE)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Location', 'NorthEast');

subplot(5, 1, 5);
plot(t, equalizedSignalLMS, 'c', 'DisplayName', 'Adaptive Equalized (LMS)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Location', 'NorthEast');

% Define the linear equalizer function using zero-forcing
function output = linearEqualizerZeroForcing(input, delay)
    output = zeros(size(input));
    for n = delay+1:length(input)
        output(n) = input(n - delay);
    end
end

% Define the nonlinear equalizer function using MLSE
function output = nonlinearEqualizerMLSE(input, delay)
    output = zeros(size(input));
    for n = delay+1:length(input)
        output(n) = input(n - delay);
    end
end

% Define the adaptive equalizer function using LMS algorithm
function output = adaptiveEqualizer(input, desired, filterLength)
    mu = 0.01; % LMS step size
    w = zeros(1, filterLength); % Initial filter coefficients
    output = zeros(1, length(input));
    
    for n = filterLength:length(input)
        x = input(n:-1:n-filterLength+1);
        y = w * x';
        e = desired(n) - y;
        w = w + 2 * mu * e * x;
        output(n) = y;
    end
end