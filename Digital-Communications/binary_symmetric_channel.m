
%{

p=0.1;
n=10000;
x=randi([0,1], 1,n);
z= rand(0,1)<p;
y=xor(x,z);


clc; clear; close all;

N = 1e5;
p_values = 0:0.05:0.5;
Pe_sim = zeros(size(p_values));

for k = 1:length(p_values)
    p = p_values(k);

    X = randi([0 1], 1, N);
    Z = rand(1, N) < p;
    Y = xor(X, Z);

    X_hat = Y;

    Pe_sim(k) = mean(X_hat ~= X);
end

% رسم النتائج
plot(p_values, Pe_sim, 'o-', 'LineWidth', 2);
grid on;
xlabel('p (Noise Probability)');
ylabel('Simulated Pe');
title('BSC Error Probability');

hold on;
plot(p_values, p_values, '--r'); % النظري Pe = p
legend('Simulation', 'Theory');


%}

clc; clear; close all;

% 1) تعريف المعطيات
N = 10000;     % عدد البتات
p = 0.1;       % احتمال الخطأ

% 2) توليد البيانات (X)
X = randi([0 1], 1, N);  % 0 أو 1 باحتمال متساوي

% 3) توليد الضجيج (Z)
Z = rand(1, N) < p;      % يعطي 1 باحتمال p

% 4) القناة (XOR)
Y = xor(X, Z);

% 5) القرار (MAP)
X_hat = Y;   % لأن p < 0.5

% 6) حساب الأخطاء
errors = sum(X_hat ~= X);

% 7) حساب احتمال الخطأ
Pe = errors / N;

% عرض النتيجة
fprintf('Probability of Error = %.4f\n', Pe);