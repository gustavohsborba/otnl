function [xk, k] = newton(func, prec, sc, x)
% Gives optimal function point using newton method

% INPUT:    func  = Function wich we want to calculate optimal value
%           prec  = golden ratio stop condition (precision)
%           sc    = gradient method precision (stop condition)
%           x     = initial evaluation point
% OUTPUT:   xk    = Optimal point found
%           k     = Number of steps to reach optimal point.

   MAX_EVALS = 100000;
   delta = 1e-6;
   [dim, ~] = size(x);
   gk = inf(dim, 1);
   
   k=0;
   xk=x;  
   while ( norm(gk) > sc && k < MAX_EVALS)
       gk = gradient(func,xk,delta);
       Fk = hessian(func,xk,delta);
       xk = xk -pinv(Fk) * gk;
       k = k+1;
   end


end

