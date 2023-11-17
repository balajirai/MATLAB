clc;
clear;

% x = linspace(0,2*pi,1000);
x = 0:0.1:2*pi;

y1 = sin(x);
y2 = cos(x);
y3 = tan(x);

subplot(2,2,1);
plot(x,y1,'r');
title('Sin Plot');
grid on;

subplot(2,2,2);
plot(x,y2,'b');
title('Cos Plot');
grid on;

subplot(2,2,[3,4]);
plot(x,y3,'m');
title('Tan Plot');
grid on;