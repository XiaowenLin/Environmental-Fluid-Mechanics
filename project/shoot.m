clear all;
clc;

xa=0; xb=10; F0=0; G0=0; GInf=1; s=1; 
N=1000; delta=1e-6; Nmax=1000;


step = (xb-xa) / N;
x = linspace(xa, xb, N+1);

F = linspace(0, 0, N+1); %  F
G = linspace(0, 0, N+1); %  first order F
H = linspace(0, 0, N+1); %  second order F

Fv = linspace(0, 0, N+1); %  df/ds
Gv = linspace(0, 0, N+1); %  dG/ds
Hv = linspace(0,0,N+1); %  dH/ds

iter = 0;

while iter < Nmax
    F(1) = F0;
    G(1) = G0;
    H(1) = s;
    Fv(1) = 0;
    Gv(1) = 1;
    Hv(1) = 1;
    
    for i = 1:N
        F(i+1) = F(i) + G(i)*step;
        G(i+1) = G(i) + H(i)*step;
        H(i+1) = H(i) -0.5*F(i)*H(i)*step;

        Fv(i+1) = Fv(i) + Gv(i)*step;
        Gv(i+1) = Gv(i) + Hv(i)*step;
        Hv(i+1) = Hv(i) + 0.5*H(i)*Fv(i)*step;
    end
    iter = iter + 1;
    s = s - (G(N+1)-GInf) / Gv(N+1);
    if abs((G(N+1)-GInf) / Gv(N+1)) < delta
        break;
    end
end

fprintf('The value for s is %.2f\n', s);
plot(x,F,'-',x,G,'--',x,H,':');
leg1 = legend('F','G','H');
set(leg1,'Location','NorthWest');
print -djpeg FGH.jpg;
close;


plot(x,G);
leg2 = legend('G');
set(leg2,'Location','NorthWest');
hold on;
plot(x,0.99);
hold off;
print -djpeg G.jpg;
close;

I = 1:1001;
index = I(G>0.99);
index = index(1);
fprintf('The F" nearest to 0.99 is %f and %f.\n', G(index-1), G(index));
fprintf('The corresponding values of eta is %f and %f.\n', x(index-1), x(index));
fprintf('The value of eta99 is %.2f\n', x(index-1)+(0.99-G(index-1))*(x(index)-x(index-1))/(G(index)-G(index-1)));

rho = 1.24; %  kg/m3
L = 0.2; b = 0.1; v = 1.5e-5; %  m2/s
U = [0.01, 0.1, 0.5];
FD = 0.66*b*U.*sqrt(v*U*L);
