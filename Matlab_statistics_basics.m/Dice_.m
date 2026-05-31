clc; clear; close all;
%{
% تجربة رمي نرد مرة واحدة
X = randi([1 6]);   % يولد عدد عشوائي من 1 إلى 6

% تعريف الأحداث
A = mod(X,2) == 0;   % إذا العدد زوجي
B = mod(X,2) == 1;   % إذا العدد فردي

% عرض النتيجة
disp(['نتيجة رمي النرد = ', num2str(X)])

if A
    disp('الحدث A تحقق: العدد زوجي')
    
end

if B
    disp('الحدث B تحقق: العدد فردي')
end
%الاحتمالات 
prop_even=sum(A)/X;
disp('prop_even =',prop_even);

prop_odd=sum(B)/X;
disp('prop_odd =',prop_odd);

%}
%تجربة القانون النظري 
S = [1 2 3 4 5 6];
A = [2 4 6];
B = [1 3 5];

P_A = length(A)/length(S);
P_B = length(B)/length(S);

disp(P_A)
disp(P_B)