% anonymous function (user define function in matlab)
clc, clearvars, close all;

% anonymous function : y = @(x) ---expression in x----
y = @(x) (-(x-3) .^2) + 10;

y(3)

