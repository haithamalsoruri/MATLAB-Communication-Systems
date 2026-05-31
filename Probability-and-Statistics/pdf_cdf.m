%{
clc  ;clear  all ;close all;
x=randn(1,1000);
figure
histogram(x,100,'Normalization','pdf')
title ('pdf')
grid on
figure
cdfplot(x)
title('CDF')
grid on

p1=sum( x< 1)/ length(x) ;
p2=sum( x< 1.8)/length(x);
fprintf('prop x<1 = ' ,p1);
fprintf('prop x<1.8 =' ,p2);
Exepected_value =mean(x);
varince =var(x);
standard_division=sqrt(x);
fprintf('mean =' ,Exepected);
fprintf('varince =', varince );
fprintf('standard deviation =',standard_division);


%for i=1:length(x)
    

clc; clear; close all;

X = randn(1,1000);

figure
histogram(X,30,'Normalization','pdf')
title('PDF')
grid on

figure
cdfplot(X)
title('CDF')
grid on

P1 = sum(X < 1)/length(X)

P2 = sum(X > -1 & X < 1)/length(X)
%}

clc; close all; clear;

x = randn(1,1000);

figure
histogram(x,100,'Normalization','pdf')
title('PDF')
grid on

figure
cdfplot(x)
title('CDF')
grid on

p1 = sum(x < 1) / length(x);
p2 = sum(x < 1.8) / length(x);

fprintf('Prob(x < 1)   = %f\n', p1);
fprintf('Prob(x < 1.8) = %f\n', p2);

Expected_value = mean(x);
variance = var(x);
standard_deviation = sqrt(variance);

fprintf('Mean = %f\n', Expected_value);
fprintf('Variance = %f\n', variance);
fprintf('Std Dev = %f\n', standard_deviation);