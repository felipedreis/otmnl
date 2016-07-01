function  [xk, k] = ellipsoid( func, rest, prec, delta, x )

    global K_MAX;
    [dim,~] = size(x);

    b1 = 1/(dim+1);
    b2 = dim^2 / ((dim^2) - 1);
    b3 = 2 / (dim + 1);

    k=1;
    xk = [];

    Qk = eye(dim); 
    xk(:, k) = x;  
    V = Inf;

    while (V >= prec && k < K_MAX)
   
        [rgrad] = check_rest(xk(:, k), rest, delta);
       
        if isnan(rgrad)
            gk = gradient(func, xk(:, k), delta);
        else
            gk = rgrad;
        end
        
        xk(:,k + 1) = xk(:,k) - b1 * (Qk * gk) /sqrt(gk' * Qk * gk);

        Qk = b2 * (Qk - (( b3 * (Qk * gk) * (Qk * gk)') / (gk' * Qk * gk)));

        k = k+1;
        V = pi*det(sqrt(Qk));
    end
end

