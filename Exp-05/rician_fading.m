N = 1000; 
K = 10;   % Rician K-factor
fd = 10;  % Maximum Doppler shift in Hz
Fs = 100;  

% Generate a transmitted sine wave signal
t = (0:N-1) / Fs; % Time vector
f_carrier = 5;     
transmitted_signal = sin(2*pi*f_carrier*t);


% Generate Rayleigh fading component (complex Gaussian random)
h_rayleigh = (randn(1, N) + 1i * randn(1, N)) / sqrt(2);

% Generate LOS component (constant)
h_los = sqrt(K / (K + 1)); 

% Combine the LOS and Rayleigh components to form the channel
h = h_los + sqrt(1 / (K + 1)) * h_rayleigh;


received_signal = transmitted_signal .* h;

% Plot the transmitted and received signals
figure;
subplot(2,1,1);
plot(t, transmitted_signal, 'b');
xlabel('Time (s)');
ylabel('Transmitted Signal');
title('Transmitted Signal');

subplot(2,1,2);
plot(t, real(received_signal), 'r'); 
% Plot real part of received signal
xlabel('Time (s)');
ylabel('Received Signal (Real Part)');
title('Received Signal (After Rician Fading Channel)');

% Display the channel impulse response
%figure;
%stem(abs(h)); % Plot magnitude of the channel impulse response
%xlabel('Tap Index');
%ylabel('Magnitude');
%title('Channel Impulse Response (Magnitude)');