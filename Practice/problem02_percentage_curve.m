% what percentage of y values are greater than 0.8 for x = 0 to 10
% y = sin(x)

clc, clearvars, close all;

% Parameters
max_x = 2*pi;           % put max_x = 10
x = linspace(0,max_x,100000);
y = sin(x);
y_check = 0;            % put y_check = 0.8

% Plot
plot(x,y, '.'), hold on, plot([0, max_x], [y_check, y_check], 'r');

% Logic
y_greater = y >= y_check;   % keep only > sign and not >= (for question)

% Percentage
FinalPercent = (sum(y_greater)/ length(y)) * 100
