% =====================================================
% Coin + Dice Simulation
% Compare Theoretical Probability vs Experimental
% =====================================================

clc; clear; close all;   % تنظيف الشاشة - حذف المتغيرات - إغلاق الرسومات

% -----------------------------------------------------
% Number of Trials
% -----------------------------------------------------
N = 1000;                % عدد مرات تكرار التجربة

% -----------------------------------------------------
% Generate Coin Toss Results
% 0 = Tail
% 1 = Head
% -----------------------------------------------------
coin = randi([0 1],1,N); % إنشاء 1000 رمية عملة عشوائية

% -----------------------------------------------------
% Generate Dice Results
% Values from 1 to 6
% -----------------------------------------------------
dice = randi([1 6],1,N); % إنشاء 1000 رمية نرد عشوائية

% =====================================================
% Define Events
% =====================================================

% -----------------------------------------------------
% Event A:
% Coin = Head AND Dice = Even Number
% Even numbers = 2,4,6
% -----------------------------------------------------
A = (coin==1) & (mod(dice,2)==0);

% -----------------------------------------------------
% Event B:
% Coin = Tail AND Dice > 4
% Dice = 5 or 6
% -----------------------------------------------------
B = (coin==0) & (dice>4);

% -----------------------------------------------------
% Event C:
% Dice = 6 only
% Coin result does not matter
% -----------------------------------------------------
C = (dice==6);

% =====================================================
% Experimental Probabilities
% Probability = Number of Successes / Total Trials
% =====================================================

Pexp_A = sum(A)/N;       % الاحتمال التجريبي للحدث A
Pexp_B = sum(B)/N;       % الاحتمال التجريبي للحدث B
Pexp_C = sum(C)/N;       % الاحتمال التجريبي للحدث C

% =====================================================
% Theoretical Probabilities
% Total possible outcomes = 12
% =====================================================

Pth_A = 3/12;           % (Head,2) (Head,4) (Head,6)
Pth_B = 2/12;           % (Tail,5) (Tail,6)
Pth_C = 2/12;           % (Head,6) (Tail,6)

% =====================================================
% Display Results in Command Window
% =====================================================

fprintf('====================================\n');
fprintf('Results after %d Trials\n',N);
fprintf('====================================\n\n');

fprintf('Event A : Head AND Even Dice\n');
fprintf('Theoretical  = %.4f\n',Pth_A);
fprintf('Experimental = %.4f\n\n',Pexp_A);

fprintf('Event B : Tail AND Dice > 4\n');
fprintf('Theoretical  = %.4f\n',Pth_B);
fprintf('Experimental = %.4f\n\n',Pexp_B);

fprintf('Event C : Dice = 6\n');
fprintf('Theoretical  = %.4f\n',Pth_C);
fprintf('Experimental = %.4f\n\n',Pexp_C);

% =====================================================
% Bar Chart Comparison
% =====================================================

theoretical  = [Pth_A Pth_B Pth_C];   % القيم النظرية
experimental = [Pexp_A Pexp_B Pexp_C];% القيم التجريبية

figure;                               % نافذة رسم جديدة
bar([theoretical; experimental]');    % رسم أعمدة مقارنة
grid on;                              % إظهار الشبكة

legend('Theoretical','Experimental'); % شرح الألوان
set(gca,'XTickLabel',{'A','B','C'});  % أسماء الأحداث

xlabel('Events');                     % اسم المحور الأفقي
ylabel('Probability');                % اسم المحور العمودي
title('Theoretical vs Experimental'); % عنوان الرسم

% =====================================================
% Running Probability for Event A
% Show Convergence as Trials Increase
% =====================================================

runningA = cumsum(A)./(1:N);   % احتمال الحدث بعد كل تجربة

figure;                        % نافذة رسم جديدة
plot(1:N,runningA,'LineWidth',2); % رسم الاحتمال التجريبي
hold on;

yline(Pth_A,'r--','LineWidth',2); % خط الاحتمال النظري

grid on;

xlabel('Number of Trials');
ylabel('Probability');
title('Convergence of Event A');

legend('Experimental','Theoretical');