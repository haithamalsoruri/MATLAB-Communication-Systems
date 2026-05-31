clc; clear; close all;

% عدد العينات
n = 10000;

% بارامترات Gaussian
mu = 5;
sigma = 2;

% توليد Gaussian قياسي
z = randn(1,n);

% تحويله للتوزيع المطلوب
x = mu + sigma*z;

% عرض بعض القيم
disp(x(1:10))
figure
% Histogram
histogram(x,30,'Normalization','pdf')

figure

% PDF النظري
t = linspace(mu-4*sigma, mu+4*sigma, 1000);
y = (1/(sigma*sqrt(2*pi))) * exp(-(t-mu).^2/(2*sigma^2));

plot(t,y,'r','LineWidth',2)

grid on
title('Gaussian Random Variable')
xlabel('x')
ylabel('Probability Density')
legend('Samples','Theoretical PDF')