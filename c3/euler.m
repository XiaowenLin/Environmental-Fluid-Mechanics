function [y, x] = euler(f,xa,xb,ya,N)
step = (xb - xa)/N;
x = linspace(xa,xb,N+1);
y = linspace(0,0,N+1);
y(1) = ya;
for i = 1 : N
    y(i+1) = y(i) + eval(subs(subs(f,'x',x(i)),'y',y(i))) * step;
    %subs(cos(a) + sin(b), [a, b], [sym('alpha'), 2])
end

end