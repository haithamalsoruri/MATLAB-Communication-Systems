% 1. تعريف الإشارة (البيانات الأساسية)
clc;clear all;close all; 
t = 0:0.01:5;             % محور الزمن من 0 إلى 5 ثوانٍ
A = 2; f = 1;             % السعة والتردد
theta = 2*pi*rand;        % زاوية عشوائية
x = A*cos(2*pi*f*t + theta); % معادلة الموجة

% 2. أخذ العينة عند t = 2.5
t_sample = 2.5;                       % تحديد زمن العينة
x_sample = A*cos(2*pi*f*t_sample + theta); % حساب قيمة الإشارة عند هذا الزمن

% 3. الرسم البياني
plot(t, x);               % رسم الموجة كاملة
hold on;                  % "تثبيت" الرسم لإضافة العينة فوقه

% رسم العمود الرأسي (من الصفر إلى قيمة العينة)
plot([t_sample t_sample], [0 x_sample], 'r', 'LineWidth', 2);

% وضع نقطة مميزة عند رأس العمود
plot(t_sample, x_sample, 'ro', 'MarkerFaceColor', 'r'); 

grid on;                  % إضافة شبكة المربعات
title('Sampling at t = 2.5');
