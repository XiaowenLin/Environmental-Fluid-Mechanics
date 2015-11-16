% cee451 p1_2
clc;
clear;
[x, N] = cee451_1(1, 0.2, 0.5, 100, 1e-6);
disp('Problem 1.2');
fprintf('The root %f and the iteration number is %d\n', x, N);