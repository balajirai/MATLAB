clc;
clear;
close all;

% Define your input signal and received signal
time = 0.001:0.001:5;
input_signal = sin(2*pi*time); % Replace this with your input signal
received_signal = awgn(input_signal, 15); % Add some noise to simulate a real-world scenario

% Set the length of the adaptive filter (equalizer)
filter_length = 10;

% Initialize the filter coefficients
filter_coefficients = zeros(1, filter_length);

% Set the step size (learning rate) for the LMS algorithm
mu = 0.01;

% Create variables to store the output of the equalizer and the error signal
output_signal = zeros(size(input_signal));
error_signal = zeros(size(input_signal));

% Perform adaptive equalization
for n = filter_length:length(input_signal)
    
    % Extract a portion of the input signal for filtering
    x = input_signal(n-filter_length+1:n);
    
    % Compute the output of the equalizer
    output_signal(n) = filter_coefficients * x';
    
    % Compute the error signal (received - actual output)
    error_signal(n) = received_signal(n) - output_signal(n);
    
    % Update the filter coefficients using the LMS update rule
    filter_coefficients = filter_coefficients + mu * error_signal(n) * x;
    
end

% Plot the original input signal, received signal, and equalized output
subplot(3, 1, 1);
plot(time, input_signal, LineWidth=1.5);
title('Input Signal');

subplot(3, 1, 2);
plot(time, received_signal, LineWidth=1.5);
title('Recieved Signal (Equalizer Input)');

subplot(3, 1, 3);
plot(time, output_signal, LineWidth=1.5);
title('Equalized Output');

% Calculate and display the mean squared error
MSE = mean(error_signal.^2);
RMSE = sqrt(MSE);
disp(['Mean Squared Error: ', num2str(MSE)]);
disp(['Root Mean Squared Error: ', num2str(RMSE)]);