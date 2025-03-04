% Receiver Code
clc; clear; close all;

% Load recorded data (replace with your recorded data)
uiopen('.\record.wav', 1);
recorded_signal = data(:)'; % Ensure it's a row vector

% Load transmitted signal parameters
load('transmitted_signal.mat', 'prn_codes', 'fs', 'data');

% Parameters
fc = 1000; % Carrier frequency
data_rate = 100; % Data rate (bits per second)
prn_length = size(prn_codes, 2); % Length of PRN code
num_satellites = size(prn_codes, 1); % Number of satellites (PRN codes)

% Synchronize and identify the signal
best_corr = 0;
best_prn_index = 0;
best_start_index = 0;

% Correlate with all PRN codes to find the best match
for i = 1:num_satellites
    correlation = xcorr(recorded_signal, prn_codes(i, :));
    [max_corr, max_index] = max(correlation);
    
    % Track the best match
    if max_corr > best_corr
        best_corr = max_corr;
        best_prn_index = i;
        best_start_index = max_index - length(recorded_signal) + 1;
    end
end

%if best_start_index + length(recorded_signal) - 1 <= length(recorded_signal)
    received_signal = recorded_signal(best_start_index:end);
%else
 %   warning('Start index out of bounds. Check synchronization.');
%end


% Remove PRN code
received_signal = received_signal(prn_length + 1:end);

% Demodulate BPSK signal
demodulated_data = bpsk_demodulate(received_signal, fc, fs, data_rate);

% Truncate demodulated data to match original data length
demodulated_data = demodulated_data(1:length(data));

% Display results
disp('Original Data:');
disp(data);
disp('Demodulated Data:');
disp(demodulated_data);

% Calculate bit error rate
bit_error_rate = sum(data ~= demodulated_data) / length(data);
disp(['Bit Error Rate: ', num2str(bit_error_rate)]);
disp(['Identified PRN Code: Satellite ', num2str(best_prn_index)]);