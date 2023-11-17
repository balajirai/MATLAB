% min max of a equation
% Example problem : y = -(x-3) .^2 + 10
clc, clearvars, close all;

x  = linspace(1,5);
y = (-(x-3) .^2) + 10;

% plot(x,y,'*');

% minimum value of the function
minVal = min(y);

% maximum value of the fucntion
[maxVal, index] = max(y);   % maxVal and the index at which max val occurs
x_maxval = x(index);        % x_maxval is the value of x at which y becomes maximum

y(3)                        % it is not the value of y at x = 10 rather it access 3rd index of y
