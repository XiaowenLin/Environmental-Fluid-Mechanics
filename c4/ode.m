function [f, g] = ode(d2f, f0, g0, xa, xb, N)
% given f0, g0 and df, dg
% get f and g
step = (xb - xa) / N;
x = linspace(xa, xb, N+1);
f = linspace(0, 0, N+1);
g = linspace(0, 0, N+1);
f(1) = f0;
g(1) = g0;
for i = 1:N
    f(i+1) = f(i) + g(i)*step;
    g(i+1) = g(i) - subs(d2f,'x',x(i))*step;
end


end