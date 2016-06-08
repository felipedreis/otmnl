function Y = f3(X)

    x=X(1,1);
    y=X(2,1);

    Y = [x+1 y+2]*[1 0; 0 0]*[x+1; y+2];
end