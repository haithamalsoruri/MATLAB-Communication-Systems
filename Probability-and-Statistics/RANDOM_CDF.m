% 1) عدد التجارب
N = 10000;

% 2) توليد رميات نرد عشوائية
data = randi([1 6], 1, N);

% 3) القيم الممكنة
x = 1:6;

% 4) حساب CDF التجريبي
ecdf = zeros(size(x));

for i = 1:length(x)
    ecdf(i) = sum(data <= x(i)) / N;
end

% 5) CDF النظري
pmf = ones(1,6) * (1/6);
cdf = cumsum(pmf);

% 6) الرسم
stairs(x, cdf, 'LineWidth', 2); hold on;
stairs(x, ecdf, '--', 'LineWidth', 2);

grid on;
legend('Theoretical CDF', 'Empirical CDF');
xlabel('x');
ylabel('F_X(x)');
title('Comparison between Theoretical and Empirical CDF');