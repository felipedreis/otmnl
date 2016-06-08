function Y = f11(X)

    x=X(1,1);
    y=X(2,1);

    Y = 9*x^2 + 4*y^2 - 10*cos(6*pi*x) -10*cos(4*pi*y);
end