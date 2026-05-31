% 1) تعريف القيم الممكنة
x = 1:6;

% 2) تعريف PMF (احتمال كل قيمة)
pmf = ones(1,6) * (1/6);

% 3) حساب CDF (جمع تراكمي)
cdf = cumsum(pmf);

% 4) الرسم
stairs(x, cdf, 'LineWidth', 2);
grid on;

% 5) تحسين الشكل
xlabel('x');
ylabel('F_X(x)');
title('CDF of a Fair Dice');