clc ;clear all ; close all;clf 

% التهيئة
n = 100000;
p = 0.5;
A = 1;

% توليد البتات
x = rand(1,n) < p;

% Mapping (BPSK)
mapp = A*(2*x) - 1;

% توليد AWGN
sigma = 0.5;
z = sigma * randn(1,n);

% الإشارة المستقبلة
y = mapp + z;

% القرار
x_hat = zeros(1,n);

for i = 1:n
    if y(i) > 0
        x_hat(i) = 1;
    else
        x_hat(i) = 0;
    end
end

% الإحصائيات
number_bit_1 = sum(x_hat == 1);
number_bit_0 = sum(x_hat == 0);
fprintf('number_bit_1\n');
disp(number_bit_1);
fprintf('number_bit_0\n');
disp(number_bit_0);



% حساب الخطأ
BER = sum(x ~= x_hat) / n;
fprintf('BER\n');
disp(BER);
number_errors=sum(x~=x_hat);
fprintf('عدد البتتات التي تم اخذ قررها خطأ \n');
disp(number_errors);
%% نختار عدد نقاط للعرض
Nplot = 100;

%% =========================
%% 1. رسم الإشارة بعد الـ Mapping
figure
stem(mapp(1:Nplot),'filled')
title('Mapped Signal (BPSK)')
xlabel('Sample Index')
ylabel('Amplitude')
grid on

%% =========================
%% 2. رسم الضوضاء
figure
plot(z(1:Nplot))
title('AWGN Noise')
xlabel('Sample Index')
ylabel('Amplitude')
grid on

%% =========================
%% 3. رسم الإشارة المستلمة
figure
plot(y(1:Nplot))
title('Received Signal (y = mapp + noise)')
xlabel('Sample Index')
ylabel('Amplitude')
grid on

%% =========================
%% 4. رسم إشارة القرار
figure
stem(x_hat(1:Nplot),'filled')
title('Detected Bits (x\_hat)')
xlabel('Sample Index')
ylabel('Bit Value')
grid on