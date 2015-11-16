clear;
A = 4;
B = linspace(0.2, 2, 100);
x = linspace(1, 100, 100);
N = linspace(1, 100, 100);
for i = 1:100
    [x(i), N(i)] = cee451_1(A, B(i), 0.5, 100, 1e-6);
end
disp('2.3(a)')
disp('   x                   B');
disp(horzcat(x',B'));
p1_3a = plot(B,x);
xlabel('B')
ylabel('root')
title('Plot of root vs. B')
saveas(p1_3a, 'p1_3a', 'pdf');

A = linspace(1, 6, 100);
B = 0.5;
x = linspace(1, 100, 100);
N = linspace(1, 100, 100);
for i = 1:100
    [x(i), N(i)] = cee451_1(A(i), B, 0.5, 100, 1e-6);
end
disp('2.3(b)')
disp('   x                   A');
disp(horzcat(x',A'));
p1_3b = plot(A,x);
xlabel('A')
ylabel('root')
title('Plot of root vs. A')
saveas(p1_3b, 'p1_3b', 'pdf');