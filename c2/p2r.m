function [result, N] = p2r(f, x1, x2, delta, Nmax)
% use p2 function to run
% calculate I for N = 1
N = 1;
I = p2(f, x1, x2, N);
result = 1:1:(Nmax-1);
result = result*0;
result(1) = I;

while N < Nmax
    % calculate I for N = N+1
    N = N + 1;
    I = p2(f, x1, x2, N);
    % store I into a vector
    result(N) = I;
    % test delta
    if abs(2*(result(N)-result(N-1))/(result(N)+result(N-1)))<delta
        break;
    end
    
end
result = result(1:N);

if N==Nmax
    disp('Attention: NMax is reached!');
end

end