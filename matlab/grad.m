function g = grad(func, x, delta)
	fx = feval(func, x);
	[N, ~ ] = size(x);
	g = zeros(N, 1);
	I = eye(N);
	
	for i = 1:N
	
		ff = feval(func, x + delta * I(:,i));
		g(i,1) = (ff - fx)/delta;
	end
end