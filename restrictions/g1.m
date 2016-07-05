function [ g ] = g1( X )
%G1 Summary of this function goes here
%   Detailed explanation goes here
    x=X(1,1);
    y=X(2,1);
    
    g =  x - y^2 + 1;

end

