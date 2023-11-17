% CDMA Demodulation
clc, clearvars, close all;

n = 10; % length of bit stream

m = randi([0, 1], 1, n); % input bits
c = randi([0, 1], 1, n); % pseudorandom code

% Message signal points
m0 = zeros(1, 100);
m1 = ones(1, 100);

% Code Signal points
c0 = zeros(1, 10);
c1 = ones(1, 10);

message = []; 
for i = 1:10
    if m(i) == 0
        message = [message, m0];
    else
        message = [message, m1];
    end
end
code = [];
for i = 1:10
    if c(i) == 0
        code = [code, c0];
    else
        code = [code, c1];
    end
end

cdma = []; 
for i = 1:10
    if m(i) == 0
        cdma = [cdma, xor(m0, code)];
    else
        cdma = [cdma, xor(m1, code)];
    end
end

time = 0.01:0.01:n;
tb = 0.01:0.01:1;

% Demodulation in Time Domain using Code Signal
demodulatedSignal = [];
for i = 1:10
    demodulatedSignal = [demodulatedSignal, xor(cdma((i-1)*length(m0)+1:i*length(m0)), code)];
end

% Demodulation in Frequency Domain using Code Signal
demodulatedSignalFreqDomain = [];
for i = 1:10
    demodulatedSignalFreqDomain = [demodulatedSignalFreqDomain, ifft(fft(cdma((i-1)*length(m0)+1:i*length(m0))) .* conj(fft(code)))];
end

figure(1);
subplot(2, 2, 1);
plot(time, message, 'b', LineWidth=1.5);
title('Message Signal');
xlabel("Time");
ylabel("Amplitude");

subplot(2, 2, 2);
plot(tb, code, 'm', LineWidth=1.5);
title('CODE Signal');
xlabel("Time");
ylabel("Amplitude");

subplot(2, 2, 3);
plot(time, cdma, 'r', LineWidth=1.5);
title('CDMA Signal');
xlabel("Time");
ylabel("Amplitude");

subplot(2, 2, 4);
plot(time, demodulatedSignal, 'b', LineWidth=1.5);
title('Demodulated Signal Time Domain');
xlabel("Time");
ylabel("Amplitude");

sgtitle('CDMA Demodulation (Time Domain)');


figure(2);
subplot(2, 2, 1);
plot(time, message, 'b', LineWidth=1.5);
title('Message Signal (Time Domain)');
xlabel("Time");
ylabel("Amplitude");

subplot(2, 2, 2);
plot(tb, code, 'm', LineWidth=1.5);
title('CODE Signal');
xlabel("Time");
ylabel("Amplitude");

subplot(2, 2, 3);
plot(time, cdma, 'r', LineWidth=1.5);
title('CDMA Signal');
xlabel("Time");
ylabel("Amplitude");

subplot(2, 2, 4);
plot(time, demodulatedSignalFreqDomain, 'g', LineWidth=1.5);
title('Demodulated Signal (Frequency Domain)');
xlabel("Frequency");
ylabel("Magnitude");

sgtitle('CDMA Demodulation (Frequency Domain)');
