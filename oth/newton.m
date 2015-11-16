function x = newton(f,dfdx,x0,tolerance)
err = Inf;
x = x0;
while abs(err) > tolerance
   xPrev = x;
   x = xPrev - f(xPrev)./dfdx(xPrev);
   % stop criterion: (f(x) - 0) < tolerance
   err = f(x); % 
   % stop criterion: change of x < tolerance
   % err = x - xPrev;
end