clc;
clear all;
close all;

%====================================================
%        Binomial Distribution Simulation
%====================================================

% probability of success
p = 0.7;

% number of Bernoulli trials in one experiment
n = 20;

% number of repeated experiments
N_exp = 1000;

fprintf('Binomial Simulation Started ...\n');
fprintf('p = %.2f\n',p);
fprintf('n = %d\n',n);
fprintf('Number of Experiments = %d\n',N_exp);
fprintf('=====================================\n');

%====================================================
% Step 1: Pre-allocation
%====================================================

binomial_result = zeros(1,N_exp);

%====================================================
% Step 2: Repeat experiment many times
%====================================================

for k = 1:N_exp
    
    % generate random numbers for one experiment
    random_value = rand(1,n);
    
    % Bernoulli trials (0 or 1)
    success = random_value <= p;
    
    % count number of successes
    binomial_result(k) = sum(success);
    
end

%====================================================
% Display first samples
%====================================================

fprintf('First 20 Binomial Samples:\n');
disp(binomial_result(1:20));

fprintf('=====================================\n');

%====================================================
% Statistical Calculations from Simulation
%====================================================

mean_sim = mean(binomial_result);
var_sim  = var(binomial_result,1);
std_sim  = std(binomial_result,1);

fprintf('Simulation Results:\n');
fprintf('Mean = %.4f\n',mean_sim);
fprintf('Variance = %.4f\n',var_sim);
fprintf('Standard Deviation = %.4f\n',std_sim);

fprintf('=====================================\n');

%====================================================
% Theoretical Values
%====================================================

mean_theory = n*p;
var_theory  = n*p*(1-p);
std_theory  = sqrt(var_theory);

fprintf('Theoretical Results:\n');
fprintf('Mean = %.4f\n',mean_theory);
fprintf('Variance = %.4f\n',var_theory);
fprintf('Standard Deviation = %.4f\n',std_theory);

fprintf('=====================================\n');

%====================================================
% PMF Estimation
%====================================================

x_value = 0:n;
pmf_value = zeros(size(x_value));

for i = 1:length(x_value)
    pmf_value(i) = sum(binomial_result == x_value(i)) / N_exp;
end

figure
stem(x_value,pmf_value,'filled');
grid on
xlabel('x');
ylabel('P(X=x)');
title('PMF of Binomial Distribution');

%====================================================
% CDF Estimation
%====================================================

cdf_value = cumsum(pmf_value);

figure
stairs(x_value,cdf_value,'LineWidth',2);
grid on
xlabel('x');
ylabel('F(x)');
title('CDF of Binomial Distribution');
ylim([0 1.1])

%====================================================
% Effect of changing p on Mean and Variance
%====================================================

p_range = 0:0.01:1;

mean_curve = n * p_range;
var_curve  = n * p_range .* (1-p_range);

figure

subplot(2,1,1)
plot(p_range,mean_curve,'LineWidth',2)
grid on
xlabel('p')
ylabel('Mean')
title('Mean vs p for Binomial')

subplot(2,1,2)
plot(p_range,var_curve,'LineWidth',2)
grid on
xlabel('p')
ylabel('Variance')
title('Variance vs p for Binomial')