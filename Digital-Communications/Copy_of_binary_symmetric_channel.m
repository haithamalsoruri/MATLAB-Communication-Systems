%توليد البيانات 
   %{

n=1000;
p=0.2;
x=randi([0 1],1,n);

 % نمذجة القناة binary symmetric channel 
 y=zeros(1,n);
 for i=1:n
     r=rand;
     if r<p; 
         
         y=x(i)   
     end
     
     
     
       
     clc; clear;

%% 1) تحديد المعطيات
N = 10000;     % عدد العينات
p = 0.2;       % احتمال الخطأ في القناة

%% 2) توليد المصدر X (0 أو 1 باحتمال متساوي)
X = randi([0 1], 1, N);

%% 3) تمرير عبر القناة (BSC)
Y = zeros(1, N);   % تهيئة

for i = 1:N
    
    r = rand;   % رقم عشوائي بين 0 و 1
    
    if r < p
        Y(i) = ~X(i);   % قلب البت (خطأ)
    else
        Y(i) = X(i);    % بدون خطأ
    end
    
end

%% 4) حساب Joint PMF (عدّ الحالات)
count00 = sum(X==0 & Y==0);
count01 = sum(X==0 & Y==1);
count10 = sum(X==1 & Y==0);
count11 = sum(X==1 & Y==1);

P00 = count00 / N;
P01 = count01 / N;
P10 = count10 / N;
P11 = count11 / N;

disp('Joint PMF:')
disp([P00 P01; P10 P11])

%% 5) Decision Rule (Classifier)
X_hat = zeros(1, N);

if p < 0.5
    X_hat = Y;          % صدّق القناة
else
    X_hat = ~Y;         % اعكس القرار
end

%% 6) حساب نسبة الخطأ (BER)
errors = sum(X_hat ~= X);
BER = errors / N;

fprintf('BER = %.4f\n', BER);
     %}
clc ; clear all 

p = 0.2;
n = 100000;

x = randi([0 1], 1, n);   % البيانات الأصلية
y = zeros(1, n);          % البيانات بعد القناة

for i = 1:n
noise = rand;

if noise < p  
    y(i) = 1 - x(i);  % قلب البت (خطأ)  
else  
    y(i) = x(i);      % بدون خطأ  
end

end
errors = sum(x ~= y);
p_estimated = errors / n