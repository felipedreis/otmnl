function [ z ] = g4( X )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

x = X(1);
y = X(2);

z = [1 -1] * [x - 2; y - 2]; 
end

