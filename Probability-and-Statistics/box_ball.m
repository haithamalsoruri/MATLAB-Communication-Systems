%% محاكاة تجربة سحب الكرات وحساب الـ CDF
clear; clc;

% 1. تعريف المعطيات الأساسية
N = 5000; % عدد مرات تكرار التجربة (كلما زاد، زادت الدقة)
box = [ones(1,5), ones(1,3)*2, ones(1,2)*3]; % الصندوق: 5 حمراء(1)، 3 بيضاء(2)، 2 سوداء(3)

% 2. إجراء المحاكاة (Samping)
results = zeros(1, N); % مصفوفة لتخزين نتائج السحب
for i = 1:N
    randomIndex = randi(10); % اختيار موقع عشوائي من الـ 10 كرات
    results(i) = box(randomIndex); % تسجيل قيمة الكرة المسحوبة
end

% 3. حساب الاحتمالات التجريبية (PMF)
p1 = sum(results == 1) / N; % احتمال الكرة الحمراء
p2 = sum(results == 2) / N; % احتمال الكرة البيضاء
p3 = sum(results == 3) / N; % احتمال الكرة السوداء

% 4. حساب دالة التوزيع التراكمي (CDF)
% التراكم يبدأ من الاحتمال الأول وصولاً إلى المجموع الكلي (1)
cdf_y = [p1, p1+p2, p1+p2+p3]; 
x_values = [1, 2, 3]; % القيم التي يمثلها المتغير العشوائي

% 5. الرسم البياني
figure;
% رسم الـ PMF (اختياري للتوضيح)
subplot(2,1,1);
stem(x_values, [p1, p2, p3], 'filled', 'LineWidth', 1.5);
title('Probability Mass Function (PMF)');
xlabel('Ball Color (1:Red, 2:White, 3:Black)');
ylabel('Probability');
grid on;
ylim([0 0.6]);

% رسم الـ CDF (وهو المطلوب)
subplot(2,1,2);
% نستخدم stairs لأن المتغير منفصل (Discrete)
stairs([0, x_values, 4], [0, cdf_y, 1], 'LineWidth', 2, 'Color', 'r');
title('Cumulative Distribution Function (CDF)');
xlabel('Value of X');
ylabel('F(x) = P(X \leq x)');
grid on;
ylim([0 1.1]);
xlim([0 4]);

% عرض القيم في الـ Command Window للتأكد
fprintf('الاحتمالات التجريبية:\n الحمراء: %.2f\n البيضاء: %.2f\n السوداء: %.2f\n', p1, p2, p3);
