clc; clear; close all;

% توليد عينات
X = randn(1,1000000);

% PDF
figure
histogram(X,100000000,'Normalization','pdf')
title('PDF')
grid on

% CDF
figure
cdfplot(X)
title('CDF')
grid on

% احتمال X < 1
P1 = sum(X < 1)/length(X)

% احتمال -1 < X < 1
P2 = sum(X > -1 & X < 1)/length(X)