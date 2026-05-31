clc;clear all ;
n=10;
x=zeros(1,n);
for i= 1:n
    x(i)=sin(i*pi/n);
end
t=1:n;
plot(t,x);
disp('x =');
disp(x);