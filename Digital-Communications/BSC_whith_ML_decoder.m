clc; clear;

n = 1000;
x = rand(1,n) < 0.5;

p = 0.3;
z = rand(1,n) < p;

y = mod(x + z, 2);
fprintf('bits generation \n ');
disp(x(1:10));
fprintf('noise generation \n');
disp(z(1:10));
fprintf('bits receive \n');
disp(y(1:10));

% ML decision
x_hat = zeros(1,n);

for i = 1:n
    if p < 0.5
        x_hat(i) = y(i);
    else
        x_hat(i) = ~y(i);
    end
end

% error calculation
fprintf('عدد البتات التي وصلت مقلوبة \n')
number_bits_flips=sum(x~=y);
disp(number_bits_flips);


fprintf('Error after detection:\n');
error_reat = sum(x ~= x_hat) / n;
disp(error_reat);