%{


n=15;%عدد الرميات
x=randi([0 1],1,1000);%متغير عشوائي 
signal=zeros(1,10);
for i=1:n
    if x(i)==1;
        signal(i)=2;
    else
        signal(i)=-2;
    end
    %حساب الاحتمال 
    pmf(i)=sum(x==i)/n;
end 

% رسم النتائج الأصلية والنبضات
subplot(3,1,1);
stem(X, 'filled'); 
title('نتائج النرد الأصلية');

subplot(3,1,2);
stairs(pulses, 'LineWidth', 2); 
title('تمثيل النبضات (-2 و 2)');
ylim([-3 3]); 
grid on;
subplot(3,1,3);
bar(1:n,pmf);
%}
clc,clear all; clf
n = 15; % عدد الرميات التي سنعالجها ونرسمها
x = randi([0 1], 1, 1000); % توليد 1000 رمية عشوائية (0 أو 1)

signal = zeros(1, n); % تأكد أن حجم المصفوفة يساوي n
pmf = zeros(1, 2);    % سنحسب الاحتمال لـ قيمتين فقط (0 و 1)

for i = 1:n
    if x(i) == 1
        signal(i) = 2;
    else
        signal(i) = -2;
    end
end

% حساب الاحتمال بشكل صحيح خارج حلقة الإشارة
% الاحتمال لـ 0 ثم لـ 1
pmf(1) = sum(x == 0) / length(x); 
pmf(2) = sum(x == 1) / length(x);

% --- الرسم البياني ---

subplot(3,1,1);
stem(x(1:n), 'filled'); % رسم أول n رمية فقط لتناسب الرسم
title('البيانات الثنائية الأصلية (0 و 1)');

subplot(3,1,2);
stairs(signal, 'LineWidth', 2); 
title('تمثيل النبضات (-2 و 2)');
ylim([-3 3]); 
grid on;

subplot(3,1,3);
bar([0 1], pmf); % رسم احتمال الـ 0 والـ 1
title('دالة الكتلة الاحتمالية PMF');
xlabel('القيمة');
ylabel('الاحتمال');
