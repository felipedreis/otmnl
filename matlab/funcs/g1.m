function [ z ] = g1( X )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
x = X(1);
y = X(2);
z = [x + 3 y + 3] * [1 0; 0 1] * [x + 3; y + 3] - 1;

end

