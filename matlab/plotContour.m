function plotContour(func, rest, xdom, ydom, points)

    global n

	[X,Y] = meshgrid(xdom,ydom);
	[l, c] = size(X);
    [r, ~] = size(rest);
    
	Z = zeros(l, c);
    R = zeros(l, c, r);
    
	for i=1:l
		for j=1:c
			Z(i,j) = feval(func, [X(i,j); Y(i,j)]);
            
            
            for k =1:r
                R(i,j,k) = feval(rest(k,:), [X(i,j); Y(i,j)]);
            end
        end
    end

    contour(X, Y, Z, 10)
	hold on
    
    for k=1:r
        contour(X,Y,R(:,:,k), 1);
    end
    
    [sp, ~] = size(points);
    for i=1:sp-1
        line(points(i,:)', points(i+1,:)')
    end
	%saveas(1, ['results/' strcat(func, num2str(n)) '_contour.jpeg'])
	%close()
    
    %contour(X,Y,Z);
    %mesh(X, Y, Z);
end
