%{
A=5;
f=2;
w=2*pi*f;
t=0:0.001:5;
y=A*cos(w*t);
plot(t,y);
xlabel('Time');
ylabel('amplitude ');
title('cosine signal');
grid on;


% اخذ عينات عشواىيا 
figure
sampling=randi([1,2],1,5);
sample_signal=A*cos(w*sampling);
stem(sampling ,sample_signal);
xlabel('sampling ');
ylabel('amplitude ');
title('الاشارة بعد اخذ العينات');

%}
A=5;
f=2;
w=2*pi*f;
t=0:0.001:5;
y=A*cos(w*t);

plot(t,y);
hold on;

% Sampling عشوائي صحيح
idx = randi(length(t),1,5);
t_samples = t(idx);
y_samples = A*cos(w*t_samples);

stem(t_samples ,y_samples,'r','filled');

xlabel('Time');
ylabel('Amplitude');
title('Signal with Random Samples');
grid on;