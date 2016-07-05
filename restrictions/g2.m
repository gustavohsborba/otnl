function [ g ] = g2( X )
%G2 Summary of this function goes here
%   Detailed explanation goes here

    x=X(1,1);
    y=X(2,1);
    
    g =  [1 -1]*[x-2; y-2];
end

