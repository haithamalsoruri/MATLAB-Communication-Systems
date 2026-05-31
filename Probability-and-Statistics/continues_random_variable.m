clc; clear; close all;

% توليد 1000 وقت عشوائي داخل ساعة
T = 60 * rand(1,1000);

% PDF
figure
histogram(T)
xlabel('Time (minutes)')
ylabel('Count')
title('PDF of Random Time')

% CDF
figure
cdfplot(T)
xlabel('Time (minutes)')
ylabel('Probability')
title('CDF of Random Time')