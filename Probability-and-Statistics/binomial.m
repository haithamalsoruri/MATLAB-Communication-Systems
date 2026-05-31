%{


data_generation = rand(1,10);
probability_success =0.5;
number_repeated =1000;
fprintf('data generation \n');
disp(data_generation);
for i=1 :
%}
 %تهيئة للتجربة وتعرييف المعاملات
p=0.5;
n=10;
number_experment=1000;
success=zeros(1,number_experment);

%البداية من توليد البيانات حيث نكرر التوليد بمقدار مرات اجراء التجربة 
%{

هذه الحلقة ستكرر التجربة N مرة.
وكل مرة تنفذ 10 رميات ثم تحفظ عدد الصور.

for i=1:number_experment
   data_generation =rand(1,n)%توليد عشرة اعداد عشواىية بين الصفر والواحد 
   
   success=data_generation<=p;
   % الفحص وتحويل البيانات المولدة الى0,1 وذلك بغرض معرفة عدد مرات الحصول على 1
   count_success(i)=sum(success );
end;




%{
عرض النتائج 
نعرض نتائج اول 20 تجؤبة 

%}
fprintf('نتائج اول 20 تجربة  \n'); 
disp(success(1:20));
%}
clc;
clear;
close all;

% تهيئة التجربة وتعريف المعاملات
p = 0.5;
n = 10;
number_experment = 1000;

% تخزين عدد النجاحات لكل تجربة
count_success = zeros(1,number_experment);

% تكرار التجربة
for i = 1:number_experment
    
    % توليد 10 أرقام عشوائية
    data_generation = rand(1,n);
    
    % تحويل النتائج إلى نجاح (1) أو فشل (0)
    success = data_generation <= p;
    
    % حساب عدد النجاحات
    count_success(i) = sum(success);
    
end

% عرض أول 20 تجربة
fprintf('نتائج اول 20 تجربة:\n');
disp(count_success(1:20));

%{
حساب احتمال الحصول على 7 صور
نفحص كم مرة ظهر الرقم 7
ثم نقسم على عدد التجارب
%}

probability_7 = sum(count_success == 7) / number_experment;

fprintf('احتمال الحصول على 7 صور = %.4f\n', probability_7);



%{
رسم توزيع عدد النجاحات%{
رسم PMF النظري للتوزيع الثنائي
%}

x = 0:n;

pmf = binopdf(x,n,p);

figure;
stem(x,pmf,'filled');

xlabel('Number of Successes');
ylabel('P(X = x)');
title('Binomial PMF');

grid on;
%{
رسم CDF النظري
%}

cdf = binocdf(x,n,p);

figure;
stairs(x,cdf,'LineWidth',2);

xlabel('Number of Successes');
ylabel('P(X \leq x)');
title('Binomial CDF');

grid on;


