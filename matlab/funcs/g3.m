function [ z ] = g3( X )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x = X(1);
y = X(2);

z = [x - 2 y - 2] * [1 0; 0 1] * [x - 2; y - 2] - 1;

end

