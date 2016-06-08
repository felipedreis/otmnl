function [Y] = f9(X) 

    x=X(1,1);
    y=X(2,1);

    Y = x^2 + y^2 -10*cos(2*pi*x) -10*cos(2*pi*y);
end