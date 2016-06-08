function Y = f5(X)
	
    x=X(1,1);
    y=X(2,1);
    Y = x * exp(-x^2-y^2);
end