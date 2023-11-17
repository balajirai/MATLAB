clear all;
clc;
% Constants
Pt = 1;      % Transmit power (in Watts)
Gt = 10;     % Transmit antenna gain (in dBi)
Gr = 15;     % Receive antenna gain (in dBi)
ht = 10;     % Height of transmitting antenna (in meters)
hr = 5;      % Height of receiving antenna (in meters)

% Define the distance range
d = linspace(1, 1000, 100); % Distance from 1 to 1000 meters

% Calculate the received power with simplified denominator
Pr = (Pt * 10^(Gt/10) * 10^(Gr/10) * (ht * hr)^2) ./ (d.^4);

% Plot the received power vs. distance
figure;
plot(d, 10*log10(Pr)); % Convert received power to dB for plotting
xlabel('Distance (meters)');
ylabel('Received Power (dBW)');
title('Received Power vs. Distance (Two-Ray Model with Simplified Denominator)');
grid on;

