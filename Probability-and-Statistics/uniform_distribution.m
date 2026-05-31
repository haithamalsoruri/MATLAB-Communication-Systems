%  النطاق 
%{

a=5;
b=10;
%نولد قيم داخل هذا النطاق 
%عدد العينات
n=1000;
x=zeros(1,n);%تهيىة قبل التولسد
x=a+(b-a)*rand(1,n);%تخزين القيم المولده 
%histogram 
histogram(x,20,'Normalization','pdf')
% PDF 

%}
clc;
clear;
close all;

% النطاق
a = 5;
b = 10;

% عدد العينات
n = 1000000000;

% توليد العينات
x = a + (b-a)*rand(1,0);
figure
% رسم histogram تقريبي للتوزيع
histogram(x,20,'Normalization','pdf')
%hold on

% PDF النظري
t = linspace(a,b,100);
y = (1/(b-a)) * ones(size(t));
figure
plot(t,y,'r','LineWidth',2)

grid on
title('Uniform Distribution PDF')
xlabel('x')
ylabel('f(x)')
legend('Simulated','Theoretical')