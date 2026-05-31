clc;clear all ;clf
x=[2 4 6 ];
prop=[0.20 0.55 0.25];
exepected=sum(x.*prop);
disp('exepected value=');
disp(exepected);
%varince
var=sum(((x-exepected).^2).*prop);
disp('varince= ');
disp(var);
%varince using onther ruel

%varince=sum(((x.^2).*prop)-exepected.^2);
x_square=x.^2;
varince =sum(x_square .*prop)-exepected.^2;
disp('varince=sum(((x.^2).*prop)-exepected.^2);');
disp(varince);
%standerd divitions
sd=sqrt(varince);
disp('standerd divitions= ');
disp(sd);
