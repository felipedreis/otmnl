function Y = f12(X)

    x=X(1,1);
    y=X(2,1);

    Y = x^2 + y^2 -0.3*cos(3*pi*x) - 0.4*cos(4*pi*y) + 0.7;
end