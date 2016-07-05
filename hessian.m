function hess = hessian( func, X, delta )
% Calculates hessian matrix of a function func in a point X, using Finite
% Differences method.

% INPUT:    func  = function for calculate gradient 
%           X     = point in wich we desire the gradient (COLUMN VECTOR)
%           delta = The amount of X o change in each dimension
% OUTPUT:   hess  = hessian matrix of func in X

    [n, ~ ] = size(X); % get dimension of X
    I = eye(n); % Eye Matrix (matriz identidade)
    
    grad=gradient(func, X, delta);
    
    for i=1:n
        Xh = X;
        Xh(i) = Xh(i) + delta;
        gxh = gradient(func, Xh, delta);
        for j=1:n
            hess(i,j) = (gxh(j)-grad(j))/delta;
        end
    end
    
end