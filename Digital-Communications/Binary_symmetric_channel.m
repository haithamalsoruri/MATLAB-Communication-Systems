
%{

clc;clear all ;close all ;clf

N = 100000; % عدد البتات المرسلة
bits = randi([0, 1], 1, N); % توليد 0 و 1 عشوائياً
x = (bits * 4) - 2; % تحويل الـ 0 إلى -2 والـ 1 إلى 2

mapping 
if bits=0 
x=(0*4)-2===> 0-2 =-2 
then x=-2 

if bits =1
x=(1*4)-2===> 4-2 =2 
then x=2

sigma = 1; % يمكنك تغيير هذه القيمة لتجربة مستويات ضجيج مختلفة
z = sigma * randn(1, N); % توليد ضجيج Gaussian
y = x + z; % الإشارة المستلمة


%}


clc; clear all; close all;

N = 100000; % عدد البتات المرسلة
bits = randi([0, 1], 1, N); % توليد 0 و 1 عشوائياً

% Mapping: 0 -> -2, 1 -> 2
x = (bits * 4) - 2; 

% --- رسم الإشارة الناتجة ---

% سنعرض أول 20 بت فقط لتكون الرؤية واضحة
num_plot = 20; 

figure;
% استخدام stairs لرسم الإشارة كدرجات (Digital Waveform)
stairs(x(1:num_plot), 'LineWidth', 2);

% تحسين شكل الرسم البياني
grid on;
axis([1 num_plot -3 3]); % تحديد أبعاد المحاور
%title(['أول '% num_node2str(num_plot) ,' بت بعد عملية الـ Mapping']);
xlabel('زمن البت (Bit Index)');
ylabel('السعة (Amplitude)');

% إضافة خط يوضح مستوى الصفر
line([1 num_plot], [0 0], 'Color', 'r', 'LineStyle', '--');

% ... (تكملة الكود السابق)

sigma = 1; 
z = sigma * randn(1, N); % AWGN توليد ضجيج
y = x + z;               % الإشارة المستلمة (الكلية)

% --- رسم النتائج ---
num_plot = 30; % سنعرض 30 عينة فقط للوضوح

figure('Name', 'تحليل الإشارة والضجيج');

% 1. رسم الضجيج فقط
subplot(3,1,1);
plot(z(1:num_plot), 'r', 'LineWidth', 1);
grid on;
title('Gaussian Noise (z)');
ylabel('Amplitude');

% 2. رسم الإشارة الأصلية (Mapped Bits)
subplot(3,1,2);
stairs(x(1:num_plot), 'b', 'LineWidth', 1.5);
grid on;
title('Original Signal (x)');
ylabel('Amplitude');
ylim([-4 4]); % تثبيت المحور للمقارنة

% 3. رسم الإشارة المستلمة (Signal + Noise)
subplot(3,1,3);
plot(y(1:num_plot), 'k', 'LineWidth', 1);
hold on;
stairs(x(1:num_plot), 'b--', 'LineWidth', 1); % رسم الإشارة الأصلية كخط متقطع للخلفية
grid on;
title('Received Signal (y = x + z)');
ylabel('Amplitude');
xlabel('Sample Index');
