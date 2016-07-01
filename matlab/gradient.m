function grad = gradient( func, X, delta )
% Calculates gradient of a function func in a point X, using Finite
% Differences method.

% INPUT:    func     = function for calculate gradient 
%           X        = point in wich we desire the gradient (COLUMN VECTOR)
%           delta    = The amount of X to change in each dimension
% OUTPUT:   gradient = gradient vector of func in X

    fx = feval(func, X);
    [n, ~ ] = size(X); % get dimension of X
    I = eye(n); % Eye Matrix (matriz identidade)
    grad = zeros(n, 1);
    
    for i=1:n
        ff = feval(func, X + delta*I(:,i));
        grad(i) = (ff - fx)/delta;
    end

end
 