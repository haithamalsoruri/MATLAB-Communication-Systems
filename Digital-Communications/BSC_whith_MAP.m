
%{
clc;clear all 
n=1000;
p=0.2;
x=rand(1,n)<0.8;
z=rand(0,n)<p;

y=mod(x+z,2);

%for i=1:n 
prop_1=sum(x ==1)/n;
prop_0=sum(x==0)/n;
%MAP
x_hat=zeros(1,n);
for i=1:n
    %if y(i) == 1
        % إذا استقبلنا 1، نقارن بين:
        % احتمال أنه كان 1 وبقي 1: (1-p) * prop_1
        % احتمال أنه كان 0 وانقلب لـ 1: p * prop_0
        if ( (1-p)*prop_1 > p*prop_0 )
            x_hat(i) = 1;
        else
            x_hat(i) = 0;
        end
  
        % إذا استقبلنا 0، نقارن بين:
        % احتمال أنه كان 0 وبقي 0: (1-p) * prop_0
        % احتمال أنه كان 1 وانقلب لـ 0: p * prop_1
elseif ( (1-p)*prop_0 > p*prop_1 )
            x_hat(i) = 0;
        else
            x_hat(i) = 1;
        end
    end
end
BER=sum(x~=x_hat)/n;
fprintf('BER = ');
disp(BER);


clc; clear;

n = 1000;
p = 0.2;
pi = 0.8;   % احتمال X=1
p_value=0:0.05:1

% توليد البيانات
x = rand(1,n) < pi;
z = rand(1,n) < p;

% القناة
y = mod(x + z, 2);

% MAP Decision
x_hat = zeros(1,n);

for i = 1:n
    if y(i) == 1
        % نقارن:
        if ( (1-p)*pi > p*(1-pi) )
            x_hat(i) = 1;
        else
            x_hat(i) = 0;
        end
    else
        % y(i) == 0
        if ( (1-p)*(1-pi) > p*pi )
            x_hat(i) = 0;
        else
            x_hat(i) = 1;
        end
    end
end

% BER
BER = sum(x ~= x_hat)/n;

fprintf('BER = %.4f\n', BER);

% الرسم
figure;
plot(p_value, BER, '-o');
xlabel('p (Channel Error Probability)');
ylabel('BER');
title('BER vs p (MAP Detector)');
grid on;
        %}

%%/////////////

clc; clear; close all;

%% 1. الإعدادات العامة (Parameters)
n = 10000;                % عدد البتات (كلما زاد زادت الدقة)
p_source = 0.8;           % احتمالية إرسال "1" (المصدر منحاز للواحد)
p_error_range = 0:0.02:0.5; % مدى ضجيج القناة (من قناة مثالية إلى قناة عشوائية)
BER = zeros(1, length(p_error_range)); % وعاء لتخزين نسبة الخطأ

%% 2. حلقة المحاكاة (Simulation Loop)
for k = 1:length(p_error_range)
    p = p_error_range(k); % احتمال الخطأ الحالي للقناة
    
    % --- توليد البيانات (Source) ---
    % نولد أرقام عشوائية، إذا كانت أقل من 0.8 نعتبرها 1
    x = rand(1, n) < p_source; 
    
    % --- نمذجة القناة (BSC Channel) ---
    % نولد ضجيجاً: إذا كان أقل من p، نعكس البت
    noise = rand(1, n) < p;
    y = mod(x + noise, 2); % عملية الـ XOR لقلب البتات
    
    % --- كاشف الـ MAP (MAP Decoder) ---
    x_hat = zeros(1, n);
    for i = 1:n
        % الحسابات تعتمد على مقارنة: (الاحتمال الشرطي * الاحتمال المسبق)
        if y(i) == 1
            % هل الأرجح أنه 1 وبقي كما هو، أم كان 0 وانقلب؟
            if (1-p)*p_source >= p*(1-p_source)
                x_hat(i) = 1;
            else
                x_hat(i) = 0;
            end
        else % في حال استقبلنا 0
            % هل الأرجح أنه 0 وبقي كما هو، أم كان 1 وانقلب؟
            if (1-p)*(1-p_source) >= p*p_source
                x_hat(i) = 0;
            else
                x_hat(i) = 1;
            end
        end
    end
    
    % --- حساب الأداء (Error Calculation) ---
    BER(k) = sum(x ~= x_hat) / n;
end

%% 3. عرض النتائج (Visualization)
figure('Color', 'w');
plot(p_error_range, BER, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4);
grid on;
xlabel('احتمال خطأ القناة (p)');
ylabel('معدل خطأ البت (BER)');
title(['محاكاة MAP لـ BSC (P(X=1) = ', num2str(p_source), ')']);

%% 4. محاكاة تنفيذ بسيطة (Output Console)
disp('--- نتيجة محاكاة سريعة ---');
fprintf('عندما يكون p = %.2f، كانت نسبة الخطأ BER = %.4f\n', p_error_range(11), BER(11));
