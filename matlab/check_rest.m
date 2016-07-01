function [ rgrad ] = check_rest(x, rest, delta)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

    [s, ~] = size(rest);
    g = zeros(s,1);
    
    for i=1:s
        g(i) = feval(rest(i, :), x);
    end
    
    [gv, index] = max(g);
    
    if(gv > 0) 
        rgrad = grad(rest(index, :), x, delta);
    else
        rgrad = NaN;
    end

end

