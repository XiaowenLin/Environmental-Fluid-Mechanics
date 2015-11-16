function [ x, N ] = newtonraphsons( f, x0, maxN, tolerance )
dfdx = diff(f,sym('x'));
error = 1;
xm = x0;
n = 0;

while(error>tolerance)
    n = n +1;
    if(n>maxN)
        break;
    end
    xn = xm - f(xm)./dfdx(xm);
    error = xn - xm;
    
end

end

