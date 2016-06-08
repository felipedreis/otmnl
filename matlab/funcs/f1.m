function [Y] = f1(X)
  
    x=X(1, 1);
    y=X(2, 1);
    
    Y = [x-2 y-1]*[2 0.2; 0.3 4]*[x-2; y-1];
end