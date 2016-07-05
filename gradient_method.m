function [xk, k] = gradient_method( func, prec, sc, x )
% Gives optimal function point using gradient method

% INPUT:    func  = Function wich we want to calculate optimal value
%           prec  = golden ratio stop condition (precision)
%           sc    = gradient method precision (stop condition)
%           x     = initial evaluation point
% OUTPUT:   xk    = Optimal point found
%           k     = Number of steps to reach optimal point.

   MAX_EVALS = 100000;

   delta = 0.001;
   [dim, ~] = size(x);
   gk = inf(dim, 1);
   
   k=0;
   xk=x;  
   while ( norm(gk) > sc && k < MAX_EVALS)
       gk = gradient(func,xk,delta);
       dk = (-1)*gk;
       alpha = golden_ratio(func,prec,0,1,xk,dk);
       xk = xk + alpha*dk;
       k = k+1;
   end
 end

