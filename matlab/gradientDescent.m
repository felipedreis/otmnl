function [xk, k] =  gradientDescent(func, prec, sc, x)
% func = differentiable and continuous function
% prec = calc precision
% sc   = stop condition
%
	k = 0;
	xk = x;
	[N, ~] = size(x);

	delta = 1e-6;
	gk = inf(N, 1);

	while (norm(gk) > sc) 
		gk = grad(func, xk, delta);
		dk = (-1)*gk;
		alpha = goldenRatio(func, prec, 0, 1, xk, dk);
		xk = xk + alpha*dk;
		k = k + 1;
		norm(gk)
	end
end