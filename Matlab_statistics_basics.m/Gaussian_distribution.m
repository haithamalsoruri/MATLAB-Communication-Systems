%{

clc ; clear all ; close all;  clf
%توليد بيانات عشوائية تتبع التوزيع الطبيعي 
generation_data=randn([0:20],1,10000);
%pdf 
gaussian_distribution=




clc; clear all; close all;

% 1. توليد بيانات (لنقل بمتوسط 15 وانحراف 3)
raw_data = 15 + 3 * randn(1, 10000); 

% 2. حساب المعاملات من البيانات التي ولدت للتو
m = mean(raw_data); 
s = std(raw_data);

% 3. إنشاء محور x ليغطي نطاق البيانات
x = linspace(min(raw_data), max(raw_data), 100);

% 4. تطبيق المعادلة (PDF) باستخدام المعاملات المحسوبة m و s
gaussian_distribution = (1 / (s * sqrt(2 * pi))) * exp(-(x - m).^2 / (2 * s^2));

% 5. الرسم للمعاينة
plot(x, gaussian_distribution, 'LineWidth', 2);
title(['Generated Mean: ', num2str(m)]);


clc; clear all; close all;

%% 1. توليد عينة عشوائية
% سنولد بيانات عشوائية (مثلاً حول الرقم 10 وبانحراف 2)
data = 10 + 2 * randn(1, 10000);

%% 2. استخراج المعاملات من العينة (Estimation)
m = mean(data);       % هذا هو الـ Mean المحسوب من البيانات
v = var(data);        % هذا هو الـ Variance المحسوب
s = std(data);        % الانحراف المعياري

% عرض القيم المحسوبة في نافذة الأوامر للتأكد
fprintf('المتوسط المحسوب: %.2f\n', m);
fprintf('التباين المحسوب: %.2f\n', v);

%% 3. إنشاء منحنى التوزيع (PDF) بناءً على الحسابات أعلاه
x_axis = linspace(min(data), max(data), 200);
% المعادلة الرياضية باستخدام القيم المستخرجة m و s
pdf_curve = (1 / (s * sqrt(2 * pi))) .* exp(-(x_axis - m).^2 / (2 * s^2));

%% 4. الرسم والمقارنة
figure;
hold on;

% رسم الهيستوغرام للبيانات الأصلية
histogram(data, 40, 'Normalization', 'pdf', 'FaceColor', [0.4 0.7 0.4], 'EdgeAlpha', 0.1);

% رسم المنحنى الرياضي المستنتج
plot(x_axis, pdf_curve, 'r', 'LineWidth', 2.5);

title(['Simulation based on Data: Mean=', num2str(m), ' Var=', num2str(v)]);
legend('البيانات العشوائية المولدة', 'المنحنى المستنتج من الحسابات');
grid on;




clc; clear all; close all;

%% 1. تحديد المعاملات المطلوب مقارنتها
means = [2, 4, 6];       % القيم المطلوبة للمتوسط
vars  = [10, 12, 15];     % القيم المطلوبة للتباين
colors = {'r', 'g', 'b'}; % ألوان مختلفة للمنحنيات

figure;
hold on;

%% 2. حلقة التكرار لرسم الحالات الثلاث
for i = 1:length(means)
    % أخذ القيم الحالية من المصفوفات
    current_mu = means(i);
    current_var = vars(i);
    current_sigma = sqrt(current_var);
    
    % أ- توليد البيانات العشوائية بناءً على المعاملات الحالية
    data = current_mu + current_sigma * randn(1, 10000);
    
    % ب- حساب المعاملات من البيانات المولدة (للتأكد من الدقة)
    m = mean(data);
    s = std(data);
    
    % ج- إنشاء محور x والمنحنى الرياضي (PDF)
    % جعلنا النطاق واسعاً (من -10 إلى 20) ليشمل كل المنحنيات في رسم واحد
    x_axis = linspace(-15, 25, 500); 
    pdf_curve = (1 / (s * sqrt(2 * pi))) .* exp(-(x_axis - m).^2 / (2 * s^2));
    
    % د- الرسم (منحنى ومدرج باهت خلفه)
    % رسم الهيستوغرام بلون شفاف قليلاً
    histogram(data, 50, 'Normalization', 'pdf', 'FaceColor', colors{i}, ...
              'FaceAlpha', 0.2, 'EdgeColor', 'none', 'DisplayName', ['Data (mu=' num2str(current_mu) ')']);
    
    % رسم منحنى PDF
    plot(x_axis, pdf_curve, colors{i}, 'LineWidth', 2, ...
         'DisplayName', ['PDF (mu=' num2str(current_mu) ', var=' num2str(current_var) ')']);
end

%% 3. تحسين شكل الرسم
title('مقارنة تأثير تغيير المتوسط والتباين على التوزيع الطبيعي');
xlabel('Values');
ylabel('Probability Density');
legend('show'); % إظهار مفتاح الرسم للتمييز بين الألوان
grid on;
hold off;




clc; clear all; close all;

%% 1. تعريف المعاملات
means = [2, 4, 6];       
vars  = [10, 12, 15];     
colors = {'#D95319', '#EDB120', '#7E2F8E'}; % ألوان مميزة

figure('Name', 'محاكاة التوزيع الطبيعي لكل حالة منفصلة');

%% 2. حلقة التكرار للرسم
for i = 1:3
    % المعاملات الحالية
    mu = means(i);
    sigma = sqrt(vars(i));
    
    % توليد البيانات
    data = mu + sigma * randn(1, 10000);
    
    % حساب الـ PDF يدوياً بناءً على خصائص البيانات المولدة
    m_est = mean(data);
    s_est = std(data);
    x = linspace(m_est - 4*s_est, m_est + 4*s_est, 200);
    pdf = (1 / (s_est * sqrt(2 * pi))) * exp(-(x - m_est).^2 / (2 * s_est^2));
    
    % --- رسم الهيستوجرام (في الجزء العلوي من الحالة i) ---
    subplot(3, 2, 2*i - 1); 
    histogram(data, 40, 'FaceColor', colors{i}, 'EdgeColor', 'w');
    title(['Histogram (Mean=' num2str(mu) ', Var=' num2str(vars(i)) ')']);
    grid on;
    
    % --- رسم شكل الجرس (في الجزء المجاور له) ---
    subplot(3, 2, 2*i);
    plot(x, pdf, 'Color', colors{i}, 'LineWidth', 2);
    fill(x, pdf, colors{i}, 'FaceAlpha', 0.2); % تظليل خفيف تحت الجرس
    title(['Normal Distribution Curve (PDF)']);
    grid on;
end

% تحسين المسافات بين الرسومات
sgtitle('تحليل التوزيع الطبيعي: الهيستوجرام مقابل منحنى الـ PDF'); 





clc; clear all; close all;

%% 1. المعاملات المطلوبة
means = [2, 4, 6];       
vars  = [10, 12, 15];     
colors = {'#D95319', '#EDB120', '#7E2F8E'}; % ألوان مختلفة لكل نافذة

%% 2. حلقة التكرار لإنشاء النوافذ (Figures)
for i = 1:length(means)
    % المعاملات الحالية
    mu = means(i);
    sigma = sqrt(vars(i));
    
    % أ- توليد البيانات العشوائية
    data = mu + sigma * randn(1, 10000);
    
    % ب- حساب المعاملات والمنحنى الرياضي
    m_est = mean(data);
    s_est = std(data);
    x = linspace(m_est - 4*s_est, m_est + 4*s_est, 500);
    pdf = (1 / (s_est * sqrt(2 * pi))) * exp(-(x - m_est).^2 / (2 * s_est^2));

    % ج- إنشاء نافذة مستقلة لكل حالة
    figure('Name', ['Case ', num2str(i), ': Mean=', num2str(mu), ' Var=', num2str(vars(i))], 'NumberTitle', 'off');

    % الرسم الأول: الهيستوجرام (في الأعلى)
    subplot(2, 1, 1); 
    histogram(data, 50, 'FaceColor', colors{i}, 'EdgeColor', 'w');
    title(['Histogram (Raw Data) - Case ', num2str(i)]);
    ylabel('Frequency');
    grid on;

    % الرسم الثاني: منحنى التوزيع (في الأسفل)
    subplot(2, 1, 2);
    plot(x, pdf, 'Color', colors{i}, 'LineWidth', 3);
    fill(x, pdf, colors{i}, 'FaceAlpha', 0.1); % تظليل خفيف للجمالية
    title(['Normal Distribution Curve (Theoretical PDF)']);
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

%}


clc; clear all; close all;

%% 1. المعاملات
means = [2, 4, 6];       
vars  = [10, 12, 15];     
colors = {'r', 'g', 'm'}; 

% إنشاء نافذة واحدة فقط بحجم مناسب
figure('Name', 'All Cases Comparison');

%% 2. حلقة التكرار
for i = 1:3
    mu = means(i);
    sigma = sqrt(vars(i));
    data = mu + sigma * randn(1, 10000);
    
    % حساب الـ PDF
    x = linspace(mu - 4*sigma, mu + 4*sigma, 200);
    pdf = (1 / (sigma * sqrt(2 * pi))) * exp(-(x - mu).^2 / (2 * sigma^2));

    % --- رسم الهيستوجرام (على اليسار) ---
    % المواقع ستكون: 1، 3، 5
    subplot(3, 2, 2*i - 1); 
    histogram(data, 40, 'FaceColor', colors{i}, 'EdgeColor', 'w');
    title(['Hist Case ', num2str(i), ': \mu=', num2str(mu)]);
    grid on;

    % --- رسم المنحنى (على اليمين) ---
    % المواقع ستكون: 2، 4، 6
    subplot(3, 2, 2*i);
    plot(x, pdf, colors{i}, 'LineWidth', 2);
    grid on;
    title(['PDF Case ', num2str(i), ': var=', num2str(vars(i))]);
end

% تحسين المسافات بين الرسوم
sgtitle('Comprehensive Normal Distribution Analysis'); 
