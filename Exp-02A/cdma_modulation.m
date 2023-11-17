% CDMA Modulation
clc, clearvars, close all;

% n = input("Enter Number of bits : ");
n = 10;
t = 0.01:0.01:1;        % time per bit
m = randi([0 1], 1, n); % bits
c = randi([0 1], 1, n); % psuedo-random code

% Message Signal
m0 = zeros(1, 100);
m1 = ones(1, 100);

% Code Signals
c0 = zeros(1, 10);
c1 = ones(1, 10);

% Modulation
message = []; code = []; cdma = [];

for i=1:10
    if m(i) == 0
        message = [message, m0];
    else
        message = [message, m1];
    end
end

for i=1:10
    if c(i) == 0
        code = [code, c0];
    else
        code = [code, c1];
    end
end

for i=1:10
    if m(i) == 0
        cdma = [cdma, xor(m0, code)];
    else
        cdma = [cdma, xor(m1, code)];
    end
end

time = 0.01:0.01:n;

subplot(2,2,1)
plot(time, message, 'b', LineWidth=1.5);
title("Message Signal");
xlabel("Time");
ylabel("Amplitude");

subplot(2,2,2)
plot(t, code, 'm', LineWidth=1.5);
title("Code Signal");
xlabel("Time");
ylabel("Amplitude");

subplot(2,2,3)
plot(time, cdma, 'r', LineWidth=1.5);
title("CDMA Signal (Time Domain)");
xlabel("Time");
ylabel("Amplitude");

% Frequency domain plots
subplot(2, 2, 4)

% Fourier Transform of the CDMA signal
cdma_freq = fft(cdma);

% Frequency axis
freq = linspace(0, 1, length(cdma_freq));

% Plot the magnitude spectrum
plot(freq, abs(cdma_freq), 'g', 'LineWidth', 1.5);
title("CDMA Signal (Frequency Domain)");
xlabel("Frequency");
ylabel("Magnitude");