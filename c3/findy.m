function [yc, yb, y] = findy(method,f,xa,xb,ya,N)
% N must be even number
    y = feval(method,f,xa,xb,ya,N)'; %  find the y array
    yc = y(N/2+1); %  find the center point of y
    yb = y(N+1); %  find the last point of y
end