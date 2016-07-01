function plotContour(func, xdom, ydom, points)

    global n

	[X,Y] = meshgrid(xdom,ydom);
	[l, c] = size(X);

	Z = zeros(l, c);

	for i=1:l
		for j=1:c
			Z(i,j) = feval(func, [X(i,j); Y(i,j)]);
		end
    end

    contour(X, Y, Z, 10)
	hold on
    
    [sp, ~] = size(points);
    for i=1:sp-1
        line(points(i,:)', points(i+1,:)')
    end
	%saveas(1, ['results/' strcat(func, num2str(n)) '_contour.jpeg'])
	%close()
    
    %contour(X,Y,Z);
    %mesh(X, Y, Z);
end
