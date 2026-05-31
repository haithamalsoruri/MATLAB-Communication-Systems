clc; clear; close all;

%% =========================
% 1) تعريف الزمن والإشارة الأصلية
%% =========================
A = 1;
f = 2;                 % Hz
t = 0:0.001:2;         % زمن مستمر
x = A*cos(2*pi*f*t);   % إشارة deterministic

%% =========================
% 2) Sampling للإشارة (Analog -> Digital)
%% =========================
fs = 10;               % sampling frequency
Ts = 1/fs;
n = 0:Ts:2;

x_sampled = A*cos(2*pi*f*n);

figure;
plot(t, x, 'b'); hold on;
stem(n, x_sampled, 'r','filled');
title('Sampling of Deterministic Signal');
legend('Continuous Signal','Sampled Points');
grid on;

%% =========================
% 3) إنشاء Random Process (عدة تحققّات)
%% =========================
num_realizations = 50;   % عدد التجارب
noise_amp = 0.5;

X = zeros(num_realizations, length(t));

for i = 1:num_realizations
    noise = noise_amp * randn(size(t)); % Gaussian noise
    X(i,:) = x + noise;
end

%% =========================
% 4) رسم بعض التحققات
%% =========================
figure;
plot(t, X(1:5,:)); 
title('عدة تحققّات من Random Process');
xlabel('Time'); ylabel('Amplitude');
grid on;

%% =========================
% 5) Ensemble Average
%% =========================
ensemble_avg = mean(X,1);

figure;
plot(t, ensemble_avg, 'k', 'LineWidth',2); hold on;
plot(t, x, 'r--','LineWidth',2);
title('Ensemble Average vs Original Signal');
legend('Ensemble Avg','Original Signal');
grid on;

%% =========================
% 6) Time Average (لتحقق واحد)
%% =========================
time_avg = mean(X(1,:)); 

disp(['Time Average (realization 1) = ', num2str(time_avg)]);

%% =========================
% 7) مقارنة بصرية
%% =========================
figure;
plot(t, X(1,:), 'b'); hold on;
yline(time_avg,'r','LineWidth',2);
title('Time Average على تحقق واحد');
legend('Signal realization','Time Average');
grid on;