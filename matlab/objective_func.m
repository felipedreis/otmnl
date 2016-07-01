function [ Z ] = objective_func(func, rest, X)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

    
    Z = feval(func, X);
    [s, ~] = size(rest);
    W = ones(s, 1) * 50; 
    g = 0;
    
    for i=1:s
        g = feval(rest(i, :), X);
    
        if (g > 0) 
            Z = Z + W(i)*40;
        end
    end
end

