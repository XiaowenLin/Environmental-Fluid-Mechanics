f = @(x)(1 - 0.2*x.^2 * log(x+1)./log(exp(1)) );
x0 = 0.5;
newtonraphsons(f, x0, 100, 0.001)

