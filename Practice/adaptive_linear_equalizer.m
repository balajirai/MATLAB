clc, clearvars, close all;

fs = 1000;
t = 0:1/fs:1;
f = 10;

inputSignal = sin(2*pi*f*t);

channelDelay = 5;
noisePower = 0.2;

distortedSignal = [zeros(1, channelDelay) inputSignal(1:end-channelDelay)]  + noisePower * randn(1, length(t));

linearEqualizerZF = linearEqualizer(distortedSignal, channelDelay);

adaptiveEqualizerLMP = adaptiveEqualizer(distortedSignal,inputSignal, channelDelay);

subplot(3,1,1);
plot(t, distortedSignal, LineWidth=1.5);

subplot(3,1,2);
plot(t, linearEqualizerZF, 'r', LineWidth=1.5);

subplot(3,1,3);
plot(t, adaptiveEqualizerLMP, "m", LineWidth=1.5);


function output = linearEqualizer(input, delay)
    output = zeros(size(input));
    for n = delay + 1 : length(input)
        output(n) = input(n-delay);
    end
end

function output = adaptiveEqualizer(input, desired, filterLength)
    mu = 0.01;  % step size
    w = zeros(1, filterLength);
    output = zeros(1, length(input));

    for n = filterLength : length(input)
        x = input(n:-1:n-filterLength+1);
        y = w*x';
        e = desired(n) - y;
        w = w + 2*mu*e*x;
        output(n) = y;
    end
end