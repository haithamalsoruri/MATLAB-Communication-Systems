clc; clear; close all;

%% إعدادات التوزيع Gaussian
mu = 0;          % المتوسط
sigma = 1;       % الانحراف المعياري
N = 10000;       % عدد العينات

%% توليد العينات العشوائية
x = mu + sigma * randn(1, N);

%% عرض أول عينات
disp('اول 20 عينة:')
disp(x(1:20))

%% رسم Histogram بشكل PDF
figure;
histogram(x, 40, 'Normalization', 'pdf');
%hold on;
grid on;

%% المجال لرسم المنحنى النظري
xx = linspace(mu - 4*sigma, mu + 4*sigma, 500);

%% PDF النظري للتوزيع الطبيعي
pdf_theoretical = (1/(sigma*sqrt(2*pi))) * exp(-((xx-mu).^2)/(2*sigma^2));
%figure
%% رسم المنحنى النظري
plot(xx, pdf_theoretical, 'r', 'LineWidth', 2);

%% تنسيق الشكل
title('Gaussian Distribution: Histogram vs Theoretical PDF');
xlabel('x');
ylabel('Probability Density');
legend('Histogram of Samples', 'Theoretical PDF');