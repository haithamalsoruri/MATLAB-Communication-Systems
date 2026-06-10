clc; clear; close all;

%% =======================
%% Parameters
%% =======================
N = 1e6;
EbNo_dB = 0:1:12; % تغيير المسمى ليعبر عن طاقة البت بدقة
BER_sim = zeros(size(EbNo_dB));
BER_theory = zeros(size(EbNo_dB));

%% =======================
%% Simulation
%% =======================
for i = 1:length(EbNo_dB)
    
    bits = rand(1, N) < 0.5;   % Source bits
    tx = 2*bits - 1;           % BPSK mapping (Eb = 1)
    
    % تحويل النسبة من dB إلى القيمة الخطية
    ebno = 10^(EbNo_dB(i)/10);
    N0 = 1/ebno;               % لأن Eb = 1
    
    % توليد الضوضاء البيضاء المضافة بناءً على النطاق الأساسي (Baseband)
    noise = sqrt(N0/2)*randn(1, N);
    rx = tx + noise;
    
    % الكاشف (Decision Making)
    bits_hat = rx > 0;
    
    % حساب معدل الخطأ التجريبي
    BER_sim(i) = sum(bits ~= bits_hat)/N;
    
    % حساب معدل الخطأ النظري الدقيق
    BER_theory(i) = 0.5 * erfc(sqrt(ebno));
    
end

%% =======================
%% Plot Results
%% =======================
figure('Color','w');

semilogy(EbNo_dB, BER_sim, 'bo-', 'LineWidth', 1.5);
hold on;
semilogy(EbNo_dB, BER_theory, 'r--', 'LineWidth', 2);

grid on;

% تعديل التسميات لتوافق المعايير الأكاديمية والهندسية
xlabel('E_b/N_0 (dB)'); 
ylabel('Bit Error Rate (BER)');
title('BPSK over AWGN Channel - BER Performance');

legend('Simulation', 'Theoretical');

% حفظ الصورة لتظهر في الـ README
saveas(gcf, 'BER_BPSK_AWGN.png');
% End of document