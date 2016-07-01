function [g, pen, index] = restrictions( X )

    x=X(1,1);
    y=X(2,1);
    
    g = zeros(4,1);

    g(1,1) =  [x+3 y+3]*[1 0 ; 0 1]*[x+3; y+3] - 1;
    g(2,1) =  x - y^2 + 1;
    g(3,1) =  [x-2 y-2]*[1 0 ; 0 1]*[x-2 ; y-2] - 1;
    g(4,1) =  [1 -1]*[x-2 y-2];

    viol = (g>0);
    pen = g*viol';
    
    index = find(max(g));
    if viol(index)==1
        index = 0;
    end
end
