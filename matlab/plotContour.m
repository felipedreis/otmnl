function plotContour(func, xdom, ydom, xstar)

	[X,Y] = meshgrid(xdom,ydom);
	[l, c] = size(X);
	Z = zeros(l, c);

	for i=1:l
		for j=1:c
			Z(i,j) = feval(func, [X(i,j); Y(i,j)]);
		end
	end

	%mesh(X,Y,Z);
	contour(X, Y, Z);
	hold on;
	plot(xstar(1), xstar(2), 'x');
	saveas(1, ['images/' func '_contour.png']);
	close();
end