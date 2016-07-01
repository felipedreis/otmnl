function  [xk, k] = ellipsoid( func, prec, delta, x )
% Gives optimal function point using Ellipsoidal method
% INPUT:    func  = Function wich we want to calculate optimal value
%           prec  = stop condition (precision)
%           delta = gradient method precision (stop condition)
%           x     = initial evaluation point
% OUTPUT:   xk    = Optimal point found
%           k     = Number of steps to reach optimal point.
   global K_MAX;
   [dim,~] = size(x);
   
   b1 = 1/(dim+1);
   b2 = dim^2 / ((dim^2) - 1);
   b3 = 2 / (dim + 1);
   
   k=1;
   xk = [];
   
   Qk = eye(dim); % Eye Matrix for initial region
   xk(:, k) = x;  
   V = Inf;
   
   while (V >= prec)
       gk = gradient(func, xk(:, k), delta);
       xk(:,k + 1) = xk(:,k) - b1 * (Qk * gk) /sqrt(gk' * Qk * gk);
       
       Qk = b2 * (Qk - (( b3 * (Qk * gk) * (Qk * gk)') / (gk' * Qk * gk)));
       
       k = k+1;
       V = pi*sqrt(det(Qk));
   end
end

