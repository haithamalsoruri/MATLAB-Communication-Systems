% 1. تعريف الإعدادات
numRealizations = 1000;    % عدد المسارات (التحققات)
t = linspace(0, 10, 500);  % المحور الزمني من 0 إلى 10
t1_idx = 150;              % اختيار نقطة زمنية محددة (الفهرس 150)

% 2. توليد العملية العشوائية (مثال: موجة سينية مع طور عشوائي)
% X(t) = A * sin(t + phi) حيث phi تتوزع بانتظام بين 0 و 2*pi
phi = 2 * pi * rand(numRealizations, 1); 
X = zeros(numRealizations, length(t));

for i = 1:numRealizations
    X(i, :) = sin(t + phi(i)); % توليد كل مسار (Realization)
end

% 3. أخذ العينة عند t1 عبر كل المسارات
X_t1 = X(:, t1_idx);

% 4. التمثيل الرسومي
figure;

% الرسم العلوي: عرض المسارات العشوائية
subplot(2,1,1);
plot(t, X(1:50, :), 'Color', [0.5 0.5 0.5 0.2]); % رسم أول 50 مسار فقط للوضوح
hold on;
xline(t(t1_idx), 'r--', 'LineWidth', 2, 'Label', 't_1');
title('Random Process Realizations');
xlabel('Time (t)');
ylabel('X(t)');

% الرسم السفلي: توزيع العينات عند t1 (Histogram)
subplot(2,1,2);
histogram(X_t1, 30, 'Normalization', 'pdf');
title(['Distribution of X(t) at t = ' num2str(t(t1_idx))]);
xlabel('Value of X(t_1)');
ylabel('Probability Density');
