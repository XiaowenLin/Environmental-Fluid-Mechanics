% % guess s
% % solve fn+1 and gn+1 -> f, g, F, G
% % get a better guess of s
% % call itself
clc;
clear;
syms x y;
d2f = -y; d3f=-1; xa=0; xb=1; f0=0; N=1000; s=1.188; delta=0.001; Nmax=100;
% [y1, iter, s]=shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax,yb);
step = (xb-xa) / N;
x = linspace(xa, xb, N+1);
y1 = linspace(0, 0, N+1);
y2 = linspace(0, 0, N+1);
y3 = linspace(0, 0, N+1);
Y1 = linspace(0, 0, N+1);
Y2 = linspace(0, 0, N+1);
iter = 0;
y1(1) = f0;
y2(1) = s;
y3(1) = s;
Y1(1) = 0;
Y2(1) = 1;
    
    for i = 1:N
        %% under a given s, get y1
        %  get y1 n+1
        y1(i+1) = y1(i) + y2(i)*step;
        %  get y2 n+1
%         yp = y2(i) + eval(subs(subs(d2f,'x',x(i)),'y',y1(i)))*step;
%         left = eval(subs(subs(d2f,'x',x(i)),'y',y1(i)));
%         right = eval(subs(subs(d2f,'x',x(i+1)),'y',yp));
%         y2(i+1) = y2(i) + 1/2*(left+right)*step;
        y2(i+1) = y2(i) + eval(subs(subs(d2f,'x',x(i)),'y',y1(i)))*step;
        
%         y3(i+1) = y3(i) - y1(i)*step;
        %% get F to update s
        Y1(i+1) = Y1(i) + Y2(i)*step;
        Y2(i+1) = Y2(i) + eval(subs(subs(d3f,'x',x(i)),'y',y1(i)))*Y1(i)*step;
        %%
    end 
    iter = iter + 1;
    s = s - (y1(N+1)-1) / Y1(N+1);
    
%     
%     