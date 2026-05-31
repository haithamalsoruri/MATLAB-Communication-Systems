clc;clear all ;
x=input('enter number');
switch x;
    case {1,2,3,4,5}
        disp('1..5');
    case {9,10}
        disp('9..10');
    otherwise 
        disp('not found');
end