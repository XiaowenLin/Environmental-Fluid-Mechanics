function [y1 , iter, s, x] = shoot(d2f, d3f, xa, xb, f0, N, s, delta, Nmax, yb)
% d2f: right hand side expression, e.g. -f^2*x
% d3f: e.g. -x*2f
step = (xb-xa) / N;
x = linspace(xa, xb, N+1);
y1 = linspace(0, 0, N+1);
y2 = linspace(0, 0, N+1);
Y1 = linspace(0, 0, N+1);
Y2 = linspace(0, 0, N+1);
iter = 0;
while iter < Nmax
    y1(1) = f0;
    y2(1) = s;
    Y1(1) = 0;
    Y2(1) = 1;
    for i = 1:N
        %% under a given s, get y1
        %  get y1 n+1
        y1(i+1) = y1(i) + y2(i)*step;
        %  get y2 n+1
        %         yp = y2(i) + eval(subs(subs(d2f,'x',x(i)),'y',y2(i)))*step;
        %         left = eval(subs(subs(d2f,'x',x(i)),'y',y2(i)));
        %         right = eval(subs(subs(d2f,'x',x(i+1)),'y',yp));
        %         y2(i+1) = y2(i) + 1/2*(left+right)*step;
        y2(i+1) = y2(i) + eval(subs(subs(d2f,'x',x(i)),'y',y1(i)))*step;
        %% get F to update s
        Y1(i+1) = Y1(i) + Y2(i)*step;
        Y2(i+1) = Y2(i) + eval(subs(subs(d3f,'x',x(i)),'y',y1(i)))*Y1(i)*step;
    end
    iter = iter + 1;
%     disp(y1(N+1));
    s = s - (y1(N+1)-yb) / Y1(N+1);
%     disp(s);
%     fprintf('%20.6f\n', abs(y1(N+1)-yb) / Y1(N+1));
    if abs(y1(N+1)-yb) / Y1(N+1) < delta
        break;
    end
end

end