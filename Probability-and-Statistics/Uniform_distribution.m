%{
clc;clear all ;close all;clf
%تحديد النطاق 
a=5;
b=10;
n=10000;
%توليد بيانات ضمن النطاق 
 x=a+(b-a)*rand(1,n);
 fprintf('data generation \n')
 disp(x(1:30));
 
 histogram(x,20,'Normalization','pdf');
 % ... (الكود السابق الخاص بك) ...

%hold on; % للسماح بالرسم فوق الهيستوجر
figure
% رسم الخط النظري للتوزيع الموحد
x_values = linspace(a-1, b+1, 1000); % نطاق أوسع قليلاً للرؤية
y_pdf = (x_values >= a & x_values <= b) * (1/(b-a));

plot(x_values, y_pdf, 'r', 'LineWidth', 2); % رسم الخط باللون الأحمر
grid on;
xlabel('Value (x)');
ylabel('Probability Density');
title('Empirical vs Theoretical PDF');
legend('Empirical (Data)', 'Theoretical PDF');

% --- رسم الـ CDF في نافذة جديدة ---
figure;

% 1. الـ CDF التجريبي (من البيانات التي ولدتها)
cdfplot(x); 
hold on;

% 2. الـ CDF النظري (المعادلة الرياضية)
% القاعدة: (x-a)/(b-a) للنطاق بين a و b
y_cdf_theoretical = (x_values - a) / (b-a);
y_cdf_theoretical(x_values < a) = 0; % قبل النطاق الاحتمال صفر
y_cdf_theoretical(x_values > b) = 1; % بعد النطاق الاحتمال واحد (100%)

plot(x_values, y_cdf_theoretical, 'r--', 'LineWidth', 2);

grid on;
xlabel('Value (x)');
ylabel('Cumulative Probability');
title('Cumulative Distribution Function (CDF)');

legend('Empirical CDF (Data)', 'Theoretical CDF', 'Location', 'NorthWest');




%}

clc; clear; close all;

%% تحديد المجال وعدد العينات
a = 5;          % الحد الأدنى
b = 10;         % الحد الأعلى
n = 10000;      % عدد العينات

%% توليد عينات عشوائية من توزيع Uniform(a,b)
x = unifrnd(a,b,1,n);

fprintf('First 20 Samples:\n');
disp(x(1:20));

%% =========================
%        PDF
% ==========================

figure;

% رسم Histogram للبيانات (تقدير تجريبي للـ PDF)
histogram(x,20,'Normalization','pdf');
hold on;

% إنشاء نقاط للرسم النظري
x_values = linspace(a-1,b+1,1000);

% حساب PDF النظري بدالة جاهزة
y_pdf = unifpdf(x_values,a,b);

% رسم PDF النظري
plot(x_values,y_pdf,'r','LineWidth',2);

grid on;
xlabel('x');
ylabel('Probability Density');
title('Uniform Distribution PDF');
legend('Empirical PDF','Theoretical PDF');

%% =========================
%        CDF
% ==========================

figure;

% رسم CDF التجريبي من العينات
cdfplot(x);
hold on;

% حساب CDF النظري بدالة جاهزة
y_cdf = unifcdf(x_values,a,b);

% رسم CDF النظري
plot(x_values,y_cdf,'r','LineWidth',2);

grid on;
xlabel('x');
ylabel('Cumulative Probability');
title('Uniform Distribution CDF');
legend('Empirical CDF','Theoretical CDF','Location','NorthWest');

%% =========================
%     Mean & Variance
% ==========================

% المتوسط من البيانات
sample_mean = mean(x);

% التباين من البيانات
sample_variance = var(x);

% المتوسط النظري
theoretical_mean = (a+b)/2;

% التباين النظري
theoretical_variance = (b-a)^2/12;

%% عرض النتائج
fprintf('\n===== Results =====\n');

fprintf('Sample Mean       = %.4f\n',sample_mean);
fprintf('Theoretical Mean  = %.4f\n',theoretical_mean);

fprintf('Sample Variance   = %.4f\n',sample_variance);
fprintf('Theoretical Var   = %.4f\n',theoretical_variance);