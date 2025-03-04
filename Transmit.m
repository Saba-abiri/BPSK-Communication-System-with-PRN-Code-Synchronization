% Transmitter Code
clc; clear; close all;

% Parameters
fs = 44100; % Sampling frequency
fc = 1000; % Carrier frequency
data_rate = 100; % Data rate (bits per second)
prn_length = 63; % Length of PRN code (e.g., 63-bit Gold code)
data_length = 50; % Length of data bits

% Generate random data
data = randi([0 1], 1, data_length);

% Generate multiple PRN codes (e.g., for 3 satellites)
prn_codes = [generateGoldCode(prn_length); % PRN code for Satellite 1
            generateGoldCode(prn_length);  % PRN code for Satellite 2
            generateGoldCode(prn_length)]; % PRN code for Satellite 3

% Select a PRN code for this transmission (e.g., Satellite 1)
selected_prn = prn_codes(1, :);

% Modulate data with BPSK
modulated_data = bpsk_modulate(data, fc, fs, data_rate);

% Add PRN code at the beginning for synchronization and identification
tx_signal = [selected_prn, modulated_data];

% Normalize signal for soundsc
tx_signal = tx_signal / max(abs(tx_signal));

% Broadcast the signal using soundsc
soundsc(tx_signal, fs);

% Save the transmitted signal and PRN codes for testing
save('transmitted_signal.mat', 'tx_signal', 'fs', 'prn_codes', 'data');