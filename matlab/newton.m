function [xk, k] = newton(func, prec, sc, x)


	k = 0;
	xk = x;
	[N, ~] = size(x);

	delta = 1e-3;
	gk = inf(N, 1);

	while (norm(gk) > sc) 
		printf('iteration %d\n', k + 1);
		gk = grad(func, xk, delta);
		hk = hessian(func, xk, delta)
		dk = (-1)*pinv(hk)*gk

		alpha = goldenRatio(func, prec, 0, 1, xk, dk);
		xk = xk + alpha*dk;
		k = k + 1;
		norm(gk)
	end
end