clc ;clear all;close all;
A = 2;
f = 1;
w = 2*pi*f;
t = 0:0.01:3; %الكمبيوتر لا يفهم "الوقت المستمر"؛ 
%لذا نحتاج لإنشاء نقاط زمنية متقطعة (Discrete points)
%لنتمكن من حساب قيمة الموجة عند كل نقطة منها.

theta = 2*pi*rand;   % قيمة عشوائية واحدة

x = A*cos(w*t + theta);
figure
plot(t, x)
%lim(1 ,5);
xlabel('time');
ylabel('amplitude ');
title('random signal whith phase random');
grid on;
% ... (الأكواد السابقة كما هي) ...
%{
% 1. تحديد زمن العينة وقيمتها
t_sample = 1.5; 
% حساب قيمة الموجة عند هذا الزمن باستخدام نفس المعادلة
x_sample = A*cos(w*t_sample + theta); 

% 2. الرسم
figure
plot(t, x, 'b', 'LineWidth', 1); % رسم الموجة الأصلية بخط أزرق
hold on; % الحفاظ على الرسم الحالي لإضافة نقطة العينة فوقه

% 3. تمثيل العينة (Sampling)
% رسم نقطة حمراء عند t=1.5
plot(t_sample, x_sample, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 

% رسم خط متقطع يوضح مكان العينة على المحاور
line([t_sample t_sample], [0 x_sample], 'Color', 'r', 'LineStyle', '--');
line([0 t_sample], [x_sample x_sample], 'Color', 'r', 'LineStyle', '--');

% 4. التنسيق الجمالي
xlabel('Time (s)');
ylabel('Amplitude');
title(['Sampling at t = ', num2str(t_sample)]);
grid on;
legend('Original Signal', 'Sample at t=1.5');

 

% اخذ عينه 
%disp('enter time sampling ');
t_target = input('enter time sampling');
sample_value = A * cos(w * t_target + theta);
hold on; % لكي لا يمسح الرسمة القديمة
plot(t_target, sample_value, 'ro', 'MarkerSize', 10, 'LineWidth', 2); 

%}

%بدلاً من حساب قيمة جديدة، نذهب للمصفوفة t ونبحث عن الترتيب (الرقم) الذي يقع فيه الزمن 1.5.
idx = find(t == 1.5); 
t_sample = t(idx); % نأخذ الزمن من المصفوفة
x_sample = x(idx); % نأخذ قيمة الموجة المقابلة له تماماً

% الآن الرسم سيكون دقيقاً 100% لأن النقطة مأخوذة من نفس بيانات المنحنى
figure
plot(t, x, 'b'); 
hold on;
plot(t_sample, x_sample, 'ro', 'MarkerFaceColor', 'r');%رسم نقطة العينة على المنحنى 

% رسم الخطوط الوهمية لتصل للمحاور بدقة
%
line([t_sample t_sample], [min(ylim) x_sample], 'Color', 'r', 'LineStyle', '--');
%line([min(xlim) t_sample], [x_sample x_sample], 'Color', 'r', 'LineStyle', '--');
grid on;
