clc; clear;

%{

نريد في قناةBSC 
المرسل يرسل 0,1 بس يرسل بتات بقيمة 1 اكثر ما يرسل بتات بقيمة 0
عندك إشارة مستلمة  y
وتريد تخمين الرمز المرسل x
باستخدام: MAP 
MAP (Maximum A Posteriori)
أي: اختر القيمة الأكثر احتمالًا لـ X بعد رؤية Y
%}
%% ===============================
% 1. Parameters
%% ===============================
n = 10000000;              % number of bits
p = 0.2;                % channel error probability
p_s = 0.8;              % P(x=1) (biased source)

%% ===============================
% 2. Generate source
%% ===============================
x = rand(1,n) < p_s;

%% ===============================
% 3. Generate noise
%% ===============================
z = rand(1,n) < p;

%% ===============================
% 4. BSC channel
%% ===============================
y = mod(x + z, 2);

%% ===============================
% 5. MAP Detector
%% ===============================
fprintf('bits generation \n ');
disp(x(1:10));
fprintf('noise generation \n');
disp(z(1:10));
fprintf('bits receive \n');
disp(y(1:10));


x_hat = zeros(1,n);

for i = 1:n
    
    if y(i) == 1
        % compare: (1-p)*p_s vs p*(1-p_s)
        if (1-p)*p_s > p*(1-p_s)
            x_hat(i) = 1;
        else
            x_hat(i) = 0;
        end
        
    else % y(i) == 0
        
        % compare: (1-p)*(1-p_s) vs p*p_s
        if (1-p)*(1-p_s) > p*p_s
            x_hat(i) = 0;
        else
            x_hat(i) = 1;
        end
        
    end
end
fprintf('bits after Decision using  MAP decoder \n');
disp(x_hat(1:10));

%% ===============================
% 6. Error calculation
%% ===============================
error = sum(x ~= x_hat) / n;

fprintf('MAP Error:\n');
disp(error);