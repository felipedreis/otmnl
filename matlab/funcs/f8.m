function Y = f8(X)
    x=X(1,1);
    y=X(2,1);

    Y = y^2 * (1-cos(2*pi*x)) + 1 - cos(y) + e^(x^2);
end