%توليد بتاتت
%{
clc ;clear all;close all ; clf
n=1000;
bits=rand(1,n)<0.5;
%mapping  
A=1;
t=0:1:n;
%mapping_function =A*(bits*2)-1;
plot(t(1:10), mapping_function(1:10));
plot (t,mapping_function(1:10) );
xlabel ('time');
ylabel('Amplitude');



clc; clear; close all;

n=1000;
bits = rand(1,n) < 0.5;

A=1;
mapping_function = A*(2*bits - 1);

t = 0:n-1;

plot(t(1:50), mapping_function(1:50));
xlabel('Time');
ylabel('Amplitude');
title('Bipolar Mapped Signal');
grid on;



% 1. توليد 10 بتات عشوائية (0 أو 1)
bits = randi([0, 1], 1, 10)<0.5;

% 2. عمل Mapping إلى (1, -1)
% القاعدة: الصفر يصبح -1 والواحد يبقى 1
% المعادلة: mapped_signal = 2 * bits - 1
mapped_signal = 2 * bits - 1;

% 3. تجهيز الرسم البياني
figure;
stairs(mapped_signal, 'LineWidth', 2); % استخدام stairs لرسم الإشارة الرقمية بشكل مربعات
grid on;

% تحسين شكل الرسم
ylim([-1.5, 1.5]); % تحديد حدود المحور الصادي لرؤية واضحة
title('Mapping 10 Bits to \pm 1 Signal');
xlabel('Bit Index');
ylabel('Amplitude');
xticks(1:10); % إظهار أرقام البتات من 1 إلى 10



%}
clc; clear; close all;

%% =========================
% 1) تعريف البارامترات
%% =========================
A = 1;              % السعة
f = 1;              % التردد (Hz)
w = 2*pi*f;         % التردد الزاوي

T = 2;              % مدة الإشارة (ثواني)
dt = 0.001;         % خطوة الزمن
t = 0:dt:T;         % محور الزمن

N = 20;             % عدد الإشارات (حجم الـ Ensemble)

%% =========================
% 2) توليد الطور العشوائي
%% =========================
theta = 2*pi*rand(1, N);   % توزيع منتظم بين 0 و 2π

%% =========================
% 3) توليد الإشارات
%% =========================
X = zeros(N, length(t));   % مصفوفة لتخزين الإشارات

for i = 1:N
    X(i, :) = A * cos(w*t + theta(i));
end

%% =========================
% 4) رسم الـ Ensemble
%% =========================
figure;
plot(t, X);
xlabel('Time');
ylabel('Amplitude');
title('Ensemble of Random Process');
grid on;
