%{
n=1000;
A=zeros (1,n);
A=rand([1,-1],1,n); %توليد قيم amplitude 
t=0:0.01:n%محور الزمن
f=1;
w=2*pi*f;
%mapping 
y=A*sin(w*t);
figure
plot(t,y);
xlabel('Time'); 
ylabel('Amplitude ');
title('Random process continues in time and amplitude ');
ylim([-A A]);


%}
clc; clear; close all;

n = 1000;

% توليد Amplitude عشوائي بين -1 و 1
A = 2*rand(1,n) - 1;

% الزمن
t = 0:0.01:(n-1)*0.01;

% التردد
f = 1;
w = 2*pi*f;

% توليد الإشارة
y = A .* sin(w*t);

% الرسم
figure
plot(t,y);
xlabel('Time'); 
ylabel('Amplitude');
title('Random process continuous in time and amplitude');
ylim([-1 1]);
grid on;