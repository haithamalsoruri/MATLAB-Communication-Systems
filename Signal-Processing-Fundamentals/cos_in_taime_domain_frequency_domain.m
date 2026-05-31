%% MATLAB Script: Baseband vs Bandpass Signal Analysis
clear; clc; close all;

% --- Parameters ---
Fs = 1000;              % Sampling frequency (Hz)
T_duration = 2;         % Duration in seconds
t = -T_duration:1/Fs:T_duration; % Time vector
A = 1;                  % Amplitude
fc = 10;                % Carrier frequency for Bandpass (Hz)
T_pulse = 1;            % Pulse width for Baseband

% --- 1. Baseband Signal (Rectangular Pulse) ---
m_t = A * (abs(t) <= T_pulse/2); 

% --- 2. Bandpass Signal (Cosine Wave) ---
% Note: Usually Bandpass is m(t)*cos(2*pi*fc*t), 
% but here we use a pure Cosine to match your second plot style.
x_t = A * cos(2*pi*fc*t);

% --- Fourier Transform Calculation ---
N = length(t);
freq = (-Fs/2 : Fs/N : Fs/2 - Fs/N); % Frequency vector

% FFT for Baseband
M_f = abs(fftshift(fft(m_t)))/Fs; 
% FFT for Bandpass
X_f = abs(fftshift(fft(x_t)))/Fs;

% --- Plotting ---

% Figure 1: Baseband Signal
figure('Color', 'w');
subplot(2,1,1);
plot(t, m_t, 'LineWidth', 2);
title('Baseband Signal - Time Domain: m(t) = A rect(t/T)');
xlabel('Time (s)'); ylabel('Amplitude');
axis([-2 2 -0.2 1.2]); grid on;

subplot(2,1,2);
plot(freq, M_f, 'r', 'LineWidth', 2);
title('Baseband Signal - Frequency Domain: M(f) = |A T sinc(f T)|');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
axis([-10 10 0 1.2]); grid on;

% Figure 2: Bandpass Signal
figure('Color', 'w');
subplot(2,1,1);
plot(t, x_t, 'b', 'LineWidth', 2);
title('Bandpass Signal - Time Domain: x(t) = A cos(2\pi f_c t)');
xlabel('Time (s)'); ylabel('Amplitude');
axis([0 1 -1.2 1.2]); grid on; % Zoomed in to see oscillations

subplot(2,1,2);
plot(freq, X_f, 'r', 'LineWidth', 2);
title('Bandpass Signal - Frequency Domain');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
axis([-20 20 0 1.2]); grid on;
