
%{
%clc;clear all;close all; clf
A = 1;              % amplitude
f = 5;              % frequency (Hz)
w = 2*pi*f;         % angular frequency
n=2;
t = linspace(0,1,1000);

% time axis
theta=zeros(1,n);

hold on;
for i=1:n
theta(i) = 2*pi*rand;        % random phase

x = A*cos(w*t + theta(i));   % signal

plot(t,x)%الرسم 
end
xlabel('Time')
ylabel('x(t)')
title('Random Phase Cosine Signal')

%hold on;

heta = 2*pi*rand(1,1000);
histogram(theta,50);
%}

clc; clear all; close all;

A = 1;
f = 5;
w = 2*pi*f;
n = 10;

t = linspace(0,1,1000);

rows = 5;
cols = 2;

for i = 1:n
    theta = 2*pi*rand;
    x = A*cos(w*t + theta);

    subplot(rows, cols, i)
    plot(t,x)
    
    title(['\theta = ', num2str(theta)])
    xlabel('Time')
    ylabel('x(t)')
    ylim([-A A])
end

%}