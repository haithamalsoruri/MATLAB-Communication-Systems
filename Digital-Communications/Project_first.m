clc; clear; close all;

% عدد البتات
n = 1000;

% سعة الإشارة
A = 1;

% الضوضاء
sigma = 1;

%% توليد البتات
data = randi([0 1],1,n);

%% Mapping
x = 2*data - 1;   % 0->-1 , 1->+1

%% توليد الضوضاء Gaussian
z = sigma * randn(1,n);

%% الإشارة المستقبلة
y = x + z;

%% اتخاذ القرار
decision = y > 0;   % إذا أكبر من صفر => 1

%% حساب الأخطاء
errors = sum(decision ~= data);

%% BER
BER = errors / n;

fprintf('عدد الأخطاء = %d\n', errors);
fprintf('BER = %.4f\n', BER);

%% رسم أول 30 عينة
figure;
stem(x(1:30),'filled');
title('Transmitted Signal');
grid on;

figure;
stem(y(1:30),'filled');
title('Received Signal');
grid on;Line 45 grid on;
Line 46 
% عدد البتاتLine 47 % عدد البتات
Line 48 
% سعة الإشارةLine 49 % سعة الإشارة
Line 50 
% الضوضاءLine 51 % الضوضاء
Line 52 
%% توليد البتاتLine 53 %% توليد البتات
Line 54 
%% MappingLine 55 %% Mapping
Line 56 
%% توليد الضوضاء GaussianLine 57 %% توليد الضوضاء Gaussian
Line 58 
%% الإشارة المستقبلةLine 59 %% الإشارة المستقبلة
Line 60 
%% اتخاذ القرارLine 61 %% اتخاذ القرار
Line 62 
%% حساب الأخطاءLine 63 %% حساب الأخطاء
Line 64 
%% BERLine 65 %% BER
Line 66 
fprintf('عدد الأخطاء = %d\n', errors);Line 67 fprintf('عدد الأخطاء = %d\n', errors);
Line 68 
%% رسم أول 30 عينةLine 69 %% رسم أول 30 عينة
Line 70 
stem(x(1:30),'filled');Line 71 stem(x(1:30),'filled');
Line 72 
grid on;Line 73 grid on;
Line 74 
figure;Line 75 figure;
Line 76 
title('Received Signal');Line 77 title('Received Signal');
Line 78 
