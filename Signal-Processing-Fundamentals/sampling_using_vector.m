%{

تعريف الموجة
t = 0:0.01:5;
theta = 2*pi*rand; 
x = 2*cos(2*pi*1*t + theta); % الموجة الأصلية

% 2. أخذ العينة عند زمن 1.5
ts = 1.5;
xs = 2*cos(2*pi*1*ts + theta); % العينة (نفس المعادلة بزمن ثابت)

% 3. الرسم
plot(t, x); % رسم الموجة
hold on;    % "تثبيت" الرسم لإضافة النقطة
plot(ts, xs, 'ro', 'MarkerFaceColor', 'r'); % رسم العينة كنقطة حمراء

% 4. التنسيق
grid on;
xlabel('Time');
ylabel('Amplitude');




%}


clc;clear all;close all 
%تعريف الموجة الأساسية (الإشارة المستمرة تخيلياً)
t = 0:0.01:5;
theta = 2*pi*rand; 
x = 2*cos(2*pi*1*t + theta);

% 2. تحديد نقاط العينات (Sampling Points)
ts = [0.5, 1, 1.5, 2, 2.5];
xs = 2*cos(2*pi*1*ts + theta); % حساب قيمة الموجة عند كل زمن في ts

% 3. الرسم
plot(t, x, 'b'); % رسم الموجة الزرقاء
hold on;
plot(ts, xs, 'ro', 'MarkerFaceColor', 'r'); % رسم النقاط الحمراء الخمس
grid on;

% 4. (إضافة اختيارية) رسم أعمدة العينات لجعلها تبدو كإشارة رقمية
stem(ts, xs, 'r', 'filled'); 
%}
