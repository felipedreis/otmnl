function Y = f4(X)
    x=X(1,1);
    y=X(2,1);

    Y = 1 - exp( -((x+4)^2)/9  -((y-2)^2)/4 );
end