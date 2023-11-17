% PSK Modulation
clc, clearvars, close all;

n = input("Enter the Number of bits : ");
t = 0.01:0.01:1;        % time per bit
a = randi([0 1], 1, n);
f1 = 1; f2 = 5;

% Message signal
m0 = zeros(1,100);
m1 = ones(1,100);

% PSK
sa0 = sin(2*pi*f1*t);
sa1 = -sin(2*pi*f1*t);

% Modulation
psk = []; m = [];
for i = 1:n
    if a(i) == 1
        m = [m, m1];
        psk = [psk, sa1];
    else
        m = [m, m0];
        psk = [psk, sa0];
    end
end

time = 0.01:0.01:n;

% Message Signal
subplot(3,1,1);
plot(time,m, 'b', LineWidth=1.5);
title("Message Signal");
xlabel("Time");
ylabel("Amplitude");

% Time Domain (PSK)
subplot(3,1,2);
plot(time,psk, 'm', LineWidth=1.5);
title("PSK (Time)");
xlabel("Time");
ylabel("Amplitude");

% Frequency Domain (PSK)
subplot(3,1,3);
frequencies = linspace(0, 1 / (2 * 0.01), length(psk));
PSK = abs(fft(psk));
plot(frequencies, PSK, 'r', LineWidth=1.5);
title("PSK (Frequency)");
xlabel("Frequency (Hz)");
ylabel("Magnitude");

