function [xnP1, N, xn] = cee451_1(A, B, x0, Nmax, delta)
% problem 1.1. the code.
syms x;
f = A - B.*x.^2.*log(x+1);
dfdx = diff(f, 'x');
xn = x0;
N = 0;

while(N < Nmax)
    xnP1 = eval(xn - subs(f./dfdx, 'x', xn));
    N = N + 1;
    if  abs(xnP1 - xn) < delta; break; end
    xn = xnP1;
end


end