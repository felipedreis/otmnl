function [g, index] = knapsack_rest(X)

    g = X - 1;
    
    [r, index] = max(g);
    
    if (r <= 0)
        index = 0;        
    end
end
