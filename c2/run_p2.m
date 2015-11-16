% main rountine to run
clear;
clc;
syms x;
delta = 1e-3;
x1 = 1;
x2 = 4;
%%
lambda = 1;
f1 = exp(-lambda*x);
[r1 N1] = p2r(f1,x1,x2,delta,100);

%%
f2 = exp(sin(x)+sqrt(x));
[r2 N2] = p2r(f1,x1,x2,delta,100);
%%
fprintf('Problem 2\nmy choice of delta=%f\n',delta);
disp('function 1');
disp('N');
fprintf('%d\n',N1);
disp('I')
fprintf('%3.3f\n',r1);

disp('function 2');
disp('N');
fprintf('%d\n',N2);
disp('I')
fprintf('%3.3f\n',r2);
