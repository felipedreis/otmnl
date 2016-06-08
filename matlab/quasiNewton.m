function [ xk, k ] = quasiNewton(func, prec, sc, x)
%QUASINEWTON Summary of this function goes here
%   Detailed explanation goes here
    global K_MAX;
    delta = 1e-6;
    
    k = 0;
    [N, ~] = size(x);
    Hk = eye(N);
    
    xk = x;
    gk = grad(func, xk, delta);
    b = 0.5;
    while (norm(gk) > sc && k < K_MAX) 
       dk = -Hk*gk;
       alpha = goldenRatio(func, prec, 0, 1, xk, dk);
       xk1 = xk + alpha*dk;
       gk1 = grad(func, xk1, delta);
       
       vk = xk  - xk1;
       rk = gk - gk1;

       Cdfp = (vk*vk')/(vk'*rk) - (Hk*rk*rk'*Hk)/(rk'*Hk*rk);
       Cbfgs = (1 + (rk'*Hk*rk)/(rk'*vk))*(vk*vk')/(vk'*rk) - (vk*rk'*Hk + Hk*rk*vk')/(rk'*vk);
       
       Ck = (1 - b)*Cdfp + b*Cbfgs;

       Hk = Hk + Ck;
       
       xk = xk1;
       gk = gk1;
       k = k + 1;
    end
end

