function N = grid(method,f,xa,xb,ya, delta)
N = 2;
while N < 100
    [yn2c, yn2b] = findy(method,f,xa,xb,ya,N+2);
    [yn1c, yn1b] = findy(method,f,xa,xb,ya,N);
    ec = abs(2*(yn2c-yn1c)/(yn2c+yn1c));
    eb = abs(2*(yn2b-yn1b)/(yn2b+yn1b));
    if ec < delta && eb < delta
        break;
    end
    N = N + 2;
end
end