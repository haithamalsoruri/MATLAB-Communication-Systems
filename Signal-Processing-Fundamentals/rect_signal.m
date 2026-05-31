% 1. إعداد المتغيرات
A = 1;          % السعة
T = 2;          % عرض النبضة
Fs = 100;       % تردد العينات
t = -10:1/Fs:10; % زمن كافٍ لرؤية التفاصيل

% 2. توليد دالة المستطيل في الزمن
m_t = A * (abs(t) <= T/2);

% 3. حساب تحويل فوريه باستخدام FFT
L = length(m_t);
NFFT = 2^nextpow2(L); % تحسين الأداء باستخدام قوة 2
M_f = fftshift(fft(m_t, NFFT)) / Fs; % تحويل وإزاحة المركز
freq = (-NFFT/2:NFFT/2-1) * (Fs/NFFT); % محور التردد

% 4. الرسم
figure;

% رسم الدالة في الزمن
subplot(2,1,1);
plot(t, m_t, 'LineWidth', 2);
title('Time Domain: m(t) = A rect(t/T)');
xlabel('Time (s)'); ylabel('Amplitude');
grid on; axis([-5 5 -0.2 1.2]);

% رسم الطيف (Magnitude Spectrum)
subplot(2,1,2);
plot(freq, abs(M_f), 'r', 'LineWidth', 2);
title('Frequency Domain: M(f) = |A T sinc(f T)|');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
grid on; axis([-5 5 -0.1 2.2]);
