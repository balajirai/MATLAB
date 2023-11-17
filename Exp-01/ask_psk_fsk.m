clc;
close all;
clear all;

%n=input('Enter the no. of bit : '); 
n = 15; % length of bit stream
a = randi([0, 1], 1, n); % input bits
f1=1;f2=5; % frequeency
tb=0.01:0.01:1;  %time per bit

%Message Signals
m0 = zeros(1, 100);
m1 = ones(1, 100);

%ASK
sa1=sin(2*pi*f1*tb);
sa0=0*sin(2*pi*f1*tb);

%FSK
sf0=sin(2*pi*f1*tb);
sf1=sin(2*pi*f2*tb);

%PSK
sp0=-sin(2*pi*f1*tb);
sp1=sin(2*pi*f1*tb);

%MODULATION
ask=[]; psk=[]; fsk=[]; m=[];
for i=1:n
    if a(i)==1
        m = [m, m1];
        ask=[ask sa1];
        psk=[psk sp1];
        fsk=[fsk sf1];
    else
        m = [m, m0];
        ask=[ask sa0];
        psk=[psk sp0];
        fsk=[fsk sf0];
    end
end

time = 0.01:0.01:n; %total time

subplot(3, 3, 1);
plot(time, m);
title('Message Signal');

subplot(3, 3, 2);
plot(tb, sf0);
title('Carrier 1');

subplot(3, 3, 3);
plot(tb, sf1);
title('Carrier 2');

subplot(3, 3, 4);
plot(time, ask);
title('ASK Modulation');

subplot(3, 3, 5);
plot(time, fsk);
title('FSK Modulation');

subplot(3, 3, 6);
plot(time, psk);
title('PSK Modulation');

ASK = abs(fft(ask)); 
PSK = abs(fft(psk));
FSK = abs(fft(fsk));

subplot(3, 3, 7);
plot(time, ASK);
title(['ASK Frequency Spectrum']);

subplot(3, 3, 8);
plot(time, FSK);
title('FSK Frequency Spectrum');

subplot(3, 3, 9);
plot(time, PSK);
title('PSK Frequency Spectrum');