function [g, pen, index] = restrictions( X )

    penFact = 50;
    

    x=X(1,1);
    y=X(2,1);
    
    g = zeros(2,1);
    g(1,1) =  x - y^2 + 1;
    g(2,1) =  [1 -1]*[x-2; y-2];
    %g(3,1) =  [x+3 y+3]*[1 0 ; 0 1]*[x+3; y+3] - 1;
    %g(4,1) =  [x-2 y-2]*[1 0 ; 0 1]*[x-2 ; y-2] - 1;
    
    viol = (g>0);
    pen = g'*viol * penFact;
    
    index = find(max(g), 1);
    
    if viol(index)==0
        index = 0;
    end
end
