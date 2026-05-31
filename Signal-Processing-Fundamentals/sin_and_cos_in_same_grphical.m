x=[0:0.01:2*pi];
y=sin(x);
z=cos(x);
%plot(x,y,'m');
%hold on;
%grid on
plot(x,y,x,z);

xlable('time');
ylable('sin(x)');
title('sin and cos waveform');

%