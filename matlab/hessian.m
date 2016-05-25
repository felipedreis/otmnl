function H = hessian(func, x, delta)

    [N, ~ ] = size(x); 
    I = eye(N); 
    
    H = zeros(N);
    g = grad(func, x, delta);
    
    for i = 1:N
        xh = x;
        xh(i) = xh(i) + delta;
        gxh = grad(func, xh, delta);
        
        for j = 1:N
            H(i,j) = (gxh(j)-g(j))/delta;
        end
    end 
end