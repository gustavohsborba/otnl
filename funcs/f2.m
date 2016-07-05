function Y = f2(X)

    x=X(1,1);
    y=X(2,1);

    Y2 = [x-1 y+1]*[1 0; 0 100]*[x-1; y+1];
    
    [ ~, penality ,~] = restrictions(X);
    Y = Y2 + penality;
end