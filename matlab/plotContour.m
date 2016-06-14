function plotContour(func, xdom, ydom, init, xstar)

	[X,Y] = meshgrid(xdom,ydom);
	[l, c] = size(X);
	Z = zeros(l, c);

	for i=1:l
		for j=1:c
			Z(i,j) = feval(func, [X(i,j); Y(i,j)]);
		end
	end

	%mesh(X,Y,Z);
	f = figure('visible', 'on');
	contour(X, Y, Z);
	hold on;
	plot(init(1), init(2), 'bo')
	plot(xstar(1), xstar(2), 'x');
	title(['Contour for function ' func])
	saveas(f, ['images/' func '_contour.png'])
	%%close(f);
end