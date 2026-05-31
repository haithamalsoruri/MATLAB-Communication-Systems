
%{
n=1000;
x=randi([1 6],1,n);
y=randi([1 6],1,n);

%pmf
x_value =input('enter value of x');
y_value=input('enter value of x');
pmf_x=zeros(1,n);
pmf_y=zeros(1,n);
for i=1:n;
    pmf_x=sum(x ==x_value)/n;
    pmf_y=sum(y==y_value)/n;
end
%}

n = 100000;

x = randi([1 6],1,n);
y = randi([1 6],1,n);

joint_pmf = zeros(6,6);
joint_cdf = zeros(6,6);

for i = 1:6
    for j = 1:6
        joint_pmf(i,j) = sum((x == i) & (y == j)) / n;
        joint_cdf(i,j) = sum((x <= i) & (y <= j)) / n;
    end
end

%{
figure;
surf(joint_pmf);
title('Joint PMF');
xlabel('Y');
ylabel('X');
zlabel('P(X,Y)');
figure;
surf(joint_cdf);
title('Joint CDF');
xlabel('Y');
ylabel('X');
zlabel('F(X,Y)');
%}

figure;
imagesc(joint_pmf);
colorbar;
title('Joint PMF Heatmap');
xlabel('Y');
ylabel('X');
figure;
imagesc(joint_cdf);
colorbar;
title('Joint CDF Heatmap');
xlabel('Y');
ylabel('X');
%}