clear;
clc;
syms k x y;
f = -k*sqrt(y)/log(x+1);
f1 = subs(f,k,0.25);
f2 = subs(f,k,0.5);
method1 = @euler;
method2 = @predictor;

% useing euler
disp('delta = 0.001 is chosen. ');
disp('Using euler method');
N_m1_f1 = grid(method1,f1,1,5,4,0.001);
N_m1_f2 = grid(method1,f2,1,5,4,0.001);

% [y1_euler, x1_euler] = euler(f1,1,5,4,N_m1_f1);
figure(1);
title('Using Euler method for function 1');
hold on;
for i = [2, 4, 6, N_m1_f1/2, N_m1_f1]
    [y1_euler, x1_euler] = euler(f1,1,5,4,i);
    plot(x1_euler, y1_euler, 'Color', [1,0,i/N_m1_f1]);
    
end
legend('N = 2', 'N = 4', 'N = 6', 'N = 13', 'N = 26');
xlabel('x'); ylabel('y');
hold off;



% [y2_euler, x2_euler] = euler(f2,1,5,4,N_m1_f2);
figure(2);
title('Using Euler method for function 2');
hold on;
for i = [2, 4, 6, N_m1_f2/2, N_m1_f2]
    [y2_euler, x2_euler] = euler(f2,1,5,4,i);
    plot(x2_euler, y2_euler, 'Color', [1,0,i/N_m1_f2]);
    
end
legend('N = 2', 'N = 4', 'N = 6', 'N = 24', 'N = 48');
xlabel('x'); ylabel('y');
hold off;
%%
% fprintf(' euler %s        %s\n',char(f1), char(f2));
% % fprintf('%8.8f    %8.8f',y1_euler, y2_euler);
% 
% sprintf('%30.8f \n',y1_euler)
% fprintf(' euler %s        %s\n',char(f1), char(f2));
% sprintf('%60.8f\n',y2_euler)
%%

% useing predictor
N_m2_f1 = grid(method2,f1,1,5,4,0.001);
N_m2_f2 = grid(method2,f2,1,5,4,0.001);

% y1_pred = euler(f1,1,5,4,N_m2_f1)';
figure(3);
title('Using predictor-corrector method for function 1');
hold on;
for i = [2, 4, 6, N_m2_f1/2, N_m2_f1]
    [y1_pred, x1_pred] = euler(f1,1,5,4,i);
    plot(x1_pred, y1_pred, 'Color', [1,0,i/N_m2_f1]);
    
end
legend('N = 2', 'N = 4', 'N = 6', 'N = 5', 'N = 10');
xlabel('x'); ylabel('y');
hold off;

% y2_pred = euler(f2,1,5,4,N_m2_f2)';
figure(4);
title('Using predictor-corrector method for function 2');
hold on;
for i = [2, 4, 5, N_m2_f2/2, N_m2_f2]
    [y2_pred, x2_pred] = euler(f2,1,5,4,i);
    plot(x2_pred, y2_pred, 'Color', [1,0,i/N_m2_f2]);
    
end
legend('N = 2', 'N = 4', 'N = 5', 'N = 6', 'N = 12');
xlabel('x'); ylabel('y');
hold off;
%%
% disp('Using predictor correct method');
% fprintf(' euler %s        %s\n',char(f1), char(f2));
% sprintf('%30.8f \n',y1_pred)
% fprintf(' euler %s        %s\n',char(f1), char(f2));
% sprintf('%60.8f\n',y2_pred)



