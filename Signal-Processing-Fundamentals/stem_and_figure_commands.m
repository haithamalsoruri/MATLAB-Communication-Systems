clc;clear all ;close all; clf
x=[0:0.01:2*pi];
y=sin(x);
figure(1);
plot(x,y);
figure(2);
z=[0:0.2:2*pi];
h=sin(z);
stem(z,h);
