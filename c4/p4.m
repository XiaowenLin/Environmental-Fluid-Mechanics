clc;
clear;
syms x y;
%% test for tutorial question
d2f = -y; d3f=-1; xa=0; xb=1; f0=0; N=1000; s=1.1; delta=0.001; Nmax=100;yb=1;
[y1_test, iter_test, s_test, x_test]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb);
figure('name', 't1');
plot(x_test, y1_test);
title('y-x for test, s=1.1, N=1000, delta=0.001');
xlabel('x');  ylabel('y');
ylim([0, 1.1]);
fprintf('For N=1000, initial s=1.1, delta=0.001, s is %f.\n',s_test);

N=100; s=2;
[y1_test, iter_test, s_test, x_test]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb);
figure('name', 't2');
plot(x_test, y1_test);
title('y-x for test, s=2, N=100, delta=0.001');
xlabel('x');  ylabel('y');
ylim([0, 1.1]);
fprintf('For N=100, initial s=2, delta=0.001, s is %f.\n',s_test);

N=100; s=1.1;
[y1_test, iter_test, s_test, x_test]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb);
figure('name', 't3');
plot(x_test, y1_test);
title('y-x for test, s=1.1, N=100, delta=0.001');
xlabel('x');  ylabel('y');
ylim([0, 1.1]);
fprintf('For N=100, initial s=1.1, delta=0.001, s is %f.\n',s_test);

N=1000; s=2;
[y1_test, iter_test, s_test, x_test]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb);
figure('name', 't4');
plot(x_test, y1_test);
title('y-x for test, s=2, N=1000, delta=0.001');
xlabel('x');  ylabel('y');
ylim([0, 1.1]);
disp(s_test);
fprintf('For N=1000, initial s=2, delta=0.001, s is %f.\n',s_test);

% run problem 4
% 1
d2f = -y^2 * x; d3f = -x*2*y; xa = 0; xb = 1; f0 = 0; N = 1000; 
s = 2.5; delta = 0.001; Nmax = 100; yb = 2;
[y1, iter1, s1, x1]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb);
figure(2);
plot(x1, y1);
title('y-x for s=2.5 and N=1000');
xlabel('x');  ylabel('y');
% 2
N = 100; 
s = 2;
[y2, iter2, s2, x2]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb);
figure(3);
plot(x2, y2);
title('y-x for s=2 and N=100');
xlabel('x');  ylabel('y');
% 3
N = 1000; 
s = 2;
[y3, iter3, s3, x3]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb);
figure(4);
plot(x3, y3);
title('y-x for s=2 and N=1000');
xlabel('x');  ylabel('y');
% 4
N = 100; 
s = 2.5;
[y4, iter4, s4, x4]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb);
figure(5);
plot(x4, y4);
title('y-x for s=2.5 and N=100');
xlabel('x');  ylabel('y');

hold all;
plot(x1, y1,'-');
plot(x2, y2,'-.');
plot(x3, y3,'.');
plot(x4, y4,'--.');
legend('N 1000 s 2.5','N 100 s 2','N 1000 s 2','N 100 s 2.5');
hold off;
disp('final s for each conditions:');
fprintf('N=1000, initial s=2.5, s1 = %f\n', s1);
fprintf('N=100, initial s=2, s2 = %f\n', s2);
fprintf('N=1000, initial s=2, s3 = %f\n', s3);
fprintf('N=100, initial s=2.5, s4 = %f\n', s4);

