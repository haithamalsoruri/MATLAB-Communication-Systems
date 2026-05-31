% 1. تعريف البارامترات
f0 = 10;           % تردد الإشارة الجيبية (Hz)
Fs = 100;          % تردد العينات (Sampling Frequency) - يجب أن يكون > 2*f0
T = 1;             % مدة الإشارة (ثانية واحدة)
t = 0 : 1/Fs : T;  % ناقل الزمن

% 2. توليد الإشارة الجيبية (Time Domain)
x_t = sin(2 * pi * f0 * t);

% 3. حساب تحويل فوريه (Frequency Domain)
L = length(x_t);           % طول الإشارة
NFFT = 2^nextpow2(L);      % تحسين كفاءة الحساب
X_f = fft(x_t, NFFT);      % حساب الـ FFT
X_f = fftshift(X_f);       % إزاحة الصفر للمنتصف
f = (-NFFT/2 : NFFT/2-1) * (Fs/NFFT); % ناقل التردد

% 4. الرسم البياني
figure;

% الرسم في مجال الزمن
subplot(2,1,1);
plot(t, x_t, 'b', 'LineWidth', 1.5);
title('Ideal Sine Signal - Time Domain');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

% الرسم في مجال التردد (المطال)
subplot(2,1,2);
plot(f, abs(X_f)/L, 'r', 'LineWidth', 1.5);
title('Ideal Sine Signal - Frequency Domain');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
grid on;
xlim([-20 20]); % تحديد الرؤية حول التردد المطلوب
