
%{
clc; clear all ;clf
%Bernoulli Distribution
x=randi([0 1],1,18);
fprintf('outcome is = %f\n');
disp(x);
for i=1:length(x);
   if x(i)==1;
       y=sum(x(i)==1)
   elseif
        m=sum(x(i)==0)
   end
end
fprintf('مرات النجاح ذ= %f\n')
disp(y);
fprintf(' مرات الفشل = %f\n');
disp(m);

clc; clear; close all;

% Bernoulli Distribution
x = randi([0 1],1,18);

disp('Outcomes are:')
disp(x)

% عدادات
y = 0;   % successes
m = 0;   % failures

for i = 1:length(x)

    if x(i) == 1
        y = y + 1;
    else
        m = m + 1;
    end

end

fprintf('Number of successes = %d\n', y);
fprintf('Number of failures  = %d\n', m);
%}
clc; clear; close all;

% Bernoulli Distribution
x = randi([0 1],1,18);

% عرض النتائج
disp('Outcomes are:')
disp(x)

% عدد النجاحات والفشل مباشرة
y = sum(x == 1);
m = sum(x == 0);

% طباعة النتائج
fprintf('Number of successes = %d\n', y);
fprintf('Number of failures  = %d\n', m);

% الاحتمال التجريبي
p_hat = y / length(x);
fprintf('Estimated probability of success = %.2f\n', p_hat);

% رسم التوزيع
figure
histogram(x,'Normalization','probability')
title('Bernoulli Distribution')
xlabel('Outcome')
ylabel('Probability')
grid on
figure 
grid on 
cdfplot(x)
title ('CDF')