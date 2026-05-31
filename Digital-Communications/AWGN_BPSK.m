clc; clear; close all;

%% =========================
%% Parameters
%% =========================
N = 1e6;                  
SNR_dB = 0:1:12;          
BER_sim = zeros(size(SNR_dB));
BER_theory = zeros(size(SNR_dB));

%% =========================
%% Simulation
%% =========================
for i = 1:length(SNR_dB)

    bits = rand(1, N) < 0.5;      % Source bits
    tx = 2*bits - 1;              % BPSK mapping

    snr = 10^(SNR_dB(i)/10);
    N0 = 1/snr;

    noise = sqrt(N0/2)*randn(1, N);
    rx = tx + noise;

    bits_hat = rx > 0;

    BER_sim(i) = sum(bits ~= bits_hat)/N;
   % BER_theory(i) = qfunc(sqrt(2*snr));
BER_theory(i) = 0.5 * erfc(sqrt(snr));

end

%% =========================
%% Plot Results
%% =========================
figure('Color','w');

semilogy(SNR_dB, BER_sim, 'bo-', 'LineWidth', 1.5);
hold on;
semilogy(SNR_dB, BER_theory, 'r--', 'LineWidth', 2);

grid on;

xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BPSK over AWGN Channel - BER Performance');

legend('Simulation', 'Theoretical');

saveas(gcf,'BER_BPSK_AWGN.png');