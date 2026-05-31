clc;
clear all;
close all;

% احتمال النجاح
probability_success = 0.7;

% عدد التجارب
n = 20;

% توليد أرقام عشوائية
random_value = rand(1,n);

fprintf('القيم المولدة عشوائياً:\n');
disp(random_value);

% تهيئة المتجهات
success = zeros(1,n);
error   = zeros(1,n);

% تحويل القيم إلى نجاح أو فشل
for i = 1:n
    
    success(i) = random_value(i) <= probability_success;
    error(i)   = random_value(i) > probability_success;

end

fprintf('success is:\n');
disp(success);
 
fprintf('error is:\n');
disp(error);

fprintf ('===================================\n');
%حساب عدد النجاحات
success_reat=sum(success);
fprintf('success reat =\n');
disp(success_reat);
%حساب عدد الخطا 
error_rate =sum(error );
fprintf('error rate =\n');
disp (error_rate);
fprintf ('==================================\n\n\n');
fprintf('calculate mean ,variance , standar division من المحاكاة\n ');

%% الحسابات الإحصائية من المحاكاة

mean_value = mean(success);
variance_value = var(success,1);
std_value = std(success,1);

fprintf('Mean = %.4f\n', mean_value);
fprintf('Variance = %.4f\n', variance_value);
fprintf('Standard Deviation = %.4f\n', std_value);
fprintf ('===================================\n\n\n');

%% القيم النظرية
fprintf('calculate mean ,variance , standar division نظريا \n ');

mean_theory = probability_success;
var_theory  = probability_success*(1-probability_success);
std_theory  = sqrt(var_theory);

fprintf('\n--- Theoretical Values ---\n');
fprintf('Mean = %.4f\n', mean_theory);
fprintf('Variance = %.4f\n', var_theory);
fprintf('Std = %.4f\n', std_theory);

%==============رسمpmf 
%تجهيز قيم المحاور 
figure
x_value =[0,1];
%y_value=[success_reat/n, error_rate/n]»»»»errors 
y_value = [error_rate/n , success_reat/n];

%دالة الرسم 

stem(x_value,y_value,'filled');
xlabel('x value ');
ylabel('probability of x value ');
title('PMF FOR Bernoulli distribution ');



%===============رسم CDF 
%figure
%% CDF
 %تجهيز محور y
cdf_value = cumsum(y_value);

figure
stairs(x_value,cdf_value,'LineWidth',2);
grid on
xlabel('X');
ylabel('CDF');
title('CDF of Bernoulli Distribution');
ylim([0 1.1])


% قيم p من 0 إلى 1
p = 0:0.01:1;

% الحسابات
mean_value = p;
variance_value = p .* (1-p);
figure

subplot(2,1,1)
plot(p,mean_value,'LineWidth',2)
grid on
title('Mean')
xlabel('p')

subplot(2,1,2)
plot(p,variance_value,'LineWidth',2)
grid on
title('Variance')
xlabel('p')
