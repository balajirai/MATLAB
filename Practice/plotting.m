% min max of a equation
% Example problem : y = -(x-3) .^2 + 10
clc, clearvars, close all;

x  = linspace(-10,10);
y1 = (-(x-3) .^2) + 10;
y2 = (-(x-3) .^2) + 15;
y3 = (-(x-5) .^2) + 10;

figure(1);
plot(x,y1, '--m', 'MarkerFaceColor','m', 'MarkerSize',10);
xlabel("x"), ylabel("y"), title("X vs Y - Problem A");
grid on;

hold on;
plot(x,y2, 'bv');

hold on;
plot(x,y3, 'b+');

legend('Y1', 'Y2', 'Y3');

% x & y axis limits
% xlim([0,2]), ylim([0,100]);


