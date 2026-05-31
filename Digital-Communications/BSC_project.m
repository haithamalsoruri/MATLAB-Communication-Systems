% تعريف المتغيرات
%{
clc; clear all 
N = 10000;          % عدد البتات
P = 0.5;            % احتمال الخطأ

% 1. توليد البيانات
tx_bits = randi([0, 1], 1, N);

% 2. توليد الأخطاء
error_vector = rand(1, N) < P;

% 3. تطبيق قناة BSC
rx_bits = xor(tx_bits, error_vector);

% 4. حساب BER
num_errors = sum(tx_bits ~= rx_bits);
actual_BER = num_errors / N;

% 5. عرض النتائج
fprintf('عدد البتات المرسلة: %d\n', N);
fprintf('احتمالية الخطأ المستهدفة: %.2f\n', P);
fprintf('نسبة الخطأ المحسوبة (BER): %.4f\n', actual_BER);
 %p = 0.1;
 %}
% --- الجزء الأول: المحاكاة (كما فعلت أنت) ---
N = 1000;%عدد البتات 
p = 0.3; %احتمالية الخطأ 
X = rand(1, N) < 0.5;%توليد بيانات رقمية 0,1  عشوائية حيث اذا القيمة المولدة اقل من احتمال
Z = rand(1, N) < p; 
Y = mod(X + Z, 2); 

% --- الجزء الثاني: حساب الاحتمالات (القرار) ---
% نريد معرفة: إذا استلمنا 1، هل الأرجح أنه كان 0 أم 1؟
sent0_and_received1 = sum(X == 0 & Y == 1);
sent1_and_received1 = sum(X == 1 & Y == 1);

% --- الجزء الثالث: اتخاذ القرار (X_hat) ---
% سنبني متجهاً جديداً للقرار
X_hat = zeros(1, N);
for i = 1:N
    if Y(i) == 1
        if sent1_and_received1 > sent0_and_received1
            X_hat(i) = 1;
        else
            X_hat(i) = 0;
        end
    else
        % نفس المنطق للصفر
        if sum(X==0 & Y==0) > sum(X==1 & Y==0)
            X_hat(i) = 0;
        else
            X_hat(i) = 1;
        end
    end
end

% --- الجزء الرابع: BER النهائي ---
final_error = sum(X ~= X_hat);
BER_final = final_error / N;

disp(['عدد الأخطاء بعد القرار: ', num2str(final_error)])
disp(['نسبة الخطأ النهائية: ', num2str(BER_final)])
