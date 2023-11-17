% Two Ray Model
clc, clearvars, close all;

Pt = 1; Gt = 10; Gr = 15; ht = 10; hr = 5;
d = linspace(1,1000);

% Power Received
Pr = (Pt * 10^(Gt/10) * 10^(Gr/10) * (ht*hr)^2) ./ (d.^4);

% Path Loss
PL = Pt ./ Pr;

subplot(2,1,1);
plot(d, 10*log10(Pr), 'b', LineWidth=1.5);
title("Power Receiver vs Distance");
grid on;

subplot(2,1,2);
plot(d, 10*log10(PL), 'r', LineWidth=1.5);
title("Path Loss vs Distance");
grid on;