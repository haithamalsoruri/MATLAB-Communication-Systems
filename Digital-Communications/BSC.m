clc;clear all 
%{
n=1000;
x=rand(1,n)<0.5;
p=0.2;
z=rand(1,n)<p;
y=mod(x+z,2);

fprintf('bits generation \n ');
disp(x(1:10));
fprintf('noise generation \n');
disp(z(1:10));
fprintf('bits receive \n');
disp(y(1:10));

error=sum(x~=y)/n;
fprintf('error \n');
disp(error);


%decision 
x_haet=zeros(1,n);
count_error=0;
for i=1:n
%if y(i) ~=x(i)
x_heat(i)=y(i) ~=x(i);
count_error =count_error+1;
end
end


%}

clc; clear; close all;

%% 1) الإعدادات
n = 1000;
p = 0.2;

pi1 = 0.8;   % P(x=1)
pi0 = 1 - pi1;

%% 2) توليد المصدر
x = rand(1,n) < pi1;

%% 3) الضجيج
z = rand(1,n) < p;

%% 4) القناة
y = mod(x + z, 2);

%% 5) MAP Detector
x_hat = zeros(1,n);

for i = 1:n
    
    if y(i) == 1
        % نقارن (1-p)*pi1 و p*pi0
        if (1-p)*pi1 > p*pi0
            x_hat(i) = 1;
        else
            x_hat(i) = 0;
        end
        
    else % y(i) == 0
        
        % نقارن p*pi1 و (1-p)*pi0
        if p*pi1 > (1-p)*pi0
            x_hat(i) = 1;
        else
            x_hat(i) = 0;
        end
        
    end
end

%% 6) حساب الخطأ
error_map = sum(x ~= x_hat)/n;
error_no_detector = sum(x ~= y)/n;

fprintf('Error without detector: %f\n', error_no_detector);
fprintf('Error with MAP: %f\n', error_map);