% محاكاة نظام اتصالات Binary Antipodal Signaling
clear; clc;

%% 1. الإعدادات (Parameters)
N = 10^6;               % عدد العينات (كلما زاد زادت الدقة)
x_values = [2, -2];     % القيم الممكنة للإشارة المرسلة
sigma_vec = 0.1:0.2:3;  % نطاق قيم الانحراف المعياري للضجيج (تغيير قوة الضجيج)

ber_simulated = zeros(1, length(sigma_vec));
ber_theoretical = zeros(1, length(sigma_vec));

%% 2. حلقة المحاكاة (Simulation Loop)
for i = 1:length(sigma_vec)
    sigma = sigma_vec(i);
    
    % أ- توليد الإشارة المرسلة (Random bits 0 or 1)
    bits = randi([0, 1], 1, N);
    x = (bits * 4) - 2;  % تحويل 0 لـ -2، و 1 لـ 2
    
    % ب- إضافة الضجيج (AWGN Channel)
    z = sigma * randn(1, N);
    y = x + z;
    
    % ج- كاشف المستقبل (Decision Maker)
    x_hat = zeros(1, N);
    x_hat(y >= 0) = 2;
    x_hat(y < 0) = -2;
    
    % د- حساب معدل الخطأ العملي
    errors = sum(x ~= x_hat);
    ber_simulated(i) = errors / N;
    
    % هـ- حساب معدل الخطأ النظري باستخدام Q-function
    % Q(x) = 0.5 * erfc(x / sqrt(2))
    ber_theoretical(i) = 0.5 * erfc((2/sigma) / sqrt(2));
end

%% 3. رسم النتائج (Plotting)
figure;
semilogy(sigma_vec, ber_simulated, 'bo', 'LineWidth', 1.5, 'MarkerSize', 8); % النتائج العملية
hold on;
semilogy(sigma_vec, ber_theoretical, 'r-', 'LineWidth', 2); % النتائج النظرية
grid on;

xlabel('\sigma (Noise Standard Deviation)');
ylabel('Bit Error Rate (BER)');
title('Simulated vs Theoretical Probability of Error');
legend('Simulated BER', 'Theoretical BER');
