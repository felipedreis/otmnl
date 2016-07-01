addpath('funcs/');

global K_MAX;
K_MAX = 100;

prec = 1e-3;
sc = 1e-3;
xi = [0 0]';

func = 'f5';
rest = ['g2'; 'g4'];

printf('function f5\n');

[xk1, k] = newton('func', prec, sc, xi);
printf('newton result: \nxk = (%.4f, %.4f)\tk = %f\n', xk1(1), xk1(2), k);

[xk2, k] = newton2('func', prec, sc, xi);
printf('newton with rank correction result: \nxk = (%.4f, %.4f)\tk = %f\n', xk2(1), xk2(2), k);

[xk3, k] = quasiNewton('func', prec, sc, xi);
printf('quasi newton result: \nxk = (%.4f, %.4f)\tk = %f\n', xk3(1), xk3(2), k);

[xk4, k] = ellipsoid(func, rest, prec, 1e-6, xi);
printf('ellipsoidal result: \nxk = (%.4f, %.4f)\tk = %f\n', xk4(1), xk4(2), k);


plotContour(func, rest, -1:0.1:1, -1:0.1:1, xi, [xk1 xk2 xk3 xk4])
fflush(stdout);
