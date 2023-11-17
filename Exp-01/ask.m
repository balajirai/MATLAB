% ASK Modulation
clc, clearvars, close all;

n = input("Enter the Number of bits : ");
t = 0.01:0.01:1;        % time per bit
a = randi([0 1], 1, n);
f1 = 1; f2 = 5;

% Message signal
m0 = zeros(1,100);
m1 = ones(1,100);

% ASK
sa0 = 0*sin(2*pi*f1*t);
sa1 = sin(2*pi*f1*t);

% Modulation
ask = []; m = [];
for i = 1:n
    if a(i) == 1
        m = [m, m1];
        ask = [ask, sa1];
    else
        m = [m, m0];
        ask = [ask, sa0];
    end
end

time = 0.01:0.01:n;

% Message Signal
subplot(3,1,1);
plot(time,m, 'b', LineWidth=1.5);
title("Message Signal");
xlabel("Time");
ylabel("Amplitude");

% Time Domain (ASK)
subplot(3,1,2);
plot(time,ask, 'm', LineWidth=1.5);
title("ASK (Time)");
xlabel("Time");
ylabel("Amplitude");

% Frequency Domain (ASK)
subplot(3,1,3);
frequencies = linspace(0, 1 / (2 * 0.01), length(ask));
ASK = abs(fft(ask));
plot(frequencies, ASK, 'r', LineWidth=1.5);
title("ASK (Frequency)");
xlabel("Frequency (Hz)");
ylabel("Magnitude");