function [ f ] = knapsack( x )

    [n, ~ ] = size(x); % get dimension of X

    Q = [-2 0 ; 0 -4];
    A = [6 4];
    b = 9;
    
    
    % Knapsack problem definition
    f = (x'*Q*x)/2; 
    
    
    % Integer penalization
    p = 0;
    for i=1:n
        dec = abs(x(i) - floor(x(i)));
        p = p + dec*(1-dec) ;
    end
    deltaInt = 15;
    f = f + deltaInt*p;
    
    
    % Smoothing
    p = 0;
    for i=1:n
        dec = abs(x(i) - floor(x(i)));
        if dec ~= 0
            p = p + log( dec*(1-dec)  );
        end
    end
    mSmooth = 0.3; %varies from 0 to 30
    f = f + mSmooth*p;
    
    
    %Restrictions:
    %if ( any(A*x <= b))
    %   f = f + 40; 
    %end
end

