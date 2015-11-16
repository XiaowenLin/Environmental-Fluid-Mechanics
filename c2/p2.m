function I = p2(f, x1, x2, N)
step = (x2-x1)/N;
x = x1:step:x2;
I = 0;

for i = 1:N
    I = I + eval(1/2*step*(subs(f,'x',x(i))+subs(f,'x',x(i+1))));
end

end