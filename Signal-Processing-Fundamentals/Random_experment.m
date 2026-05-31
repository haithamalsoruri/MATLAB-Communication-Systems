N_exp = 100;

x = [ones(1,200) zeros(1,200)];

N = length(x);

Z = [];

for n=1:N_exp

y = x + 0.05*randn(1,N);

Z = [Z;y];

10

end

11

[X,T] = meshgrid (1:N, 1:N_exp);

12

surf(X,T,Z)