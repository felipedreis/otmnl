function [xk, k] = newton2(func, prec, sc, x)
    global K_MAX;
    delta = 1e-6;
    
    k = 0;
    [N, ~] = size(x);
    Hk = eye(N);
    
    xk = x;
    gk = grad(func, xk, delta);
    
    while (norm(gk) > sc && k < K_MAX) 
       dk = -Hk*gk;
       alpha = goldenRatio(func, prec, 0, 1, xk, dk);
       xk1 = xk + alpha*dk;
       gk1 = grad(func, xk1, delta);
       
       vk = xk  - xk1;
       rk = gk - gk1;
       
       Hk1 = Hk + ((vk - Hk*rk)*(vk - Hk*rk)')/(rk'*vk - rk'*Hk*rk);
       
       xk = xk1;
       Hk = Hk1;
       gk = gk1;
       k = k + 1;
    end
end