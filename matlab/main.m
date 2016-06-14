addpath('funcs/');

global K_MAX;
K_MAX = 100;

prec = 1e-3;
sc = 1e-3;
xi = [3 5]';

f=9;

for f=1:12
	func = ['f' int2str(f)];
	printf('function %s\n', func);

	[xk1, k] = newton(func, prec, sc, xi);
	printf('newton result: \nxk = (%.4f, %.4f)\tk = %f\n', xk1(1), xk1(2), k);

	[xk2, k] = newton2(func, prec, sc, xi);
	printf('newton with rank correction result: \nxk = (%.4f, %.4f)\tk = %f\n', xk2(1), xk2(2), k);

	[xk3, k] = quasiNewton(func, prec, sc, xi);
	printf('quasi newton result: \nxk = (%.4f, %.4f)\tk = %f\n', xk3(1), xk3(2), k);

	plotContour(func, -20:20, -20:20, xi, [xk1 xk2 xk3])
	fflush(stdout);
end