function [xk, k] = ranked_newton(func, prec, sc, x)
% Gives optimal function point using newton method with Rank correction

% INPUT:    func  = Function wich we want to calculate optimal value
%           prec  = golden ratio stop condition (precision)
%           sc    = gradient method precision (stop condition)
%           x     = initial evaluation point
% OUTPUT:   xk    = Optimal point found
%           k     = Number of steps to reach optimal point.

   MAX_EVALS = 100000;
   delta = 1e-6;
   [dim, ~] = size(x);
   xk=x;
   
   k=0;
   Hk = eye(dim);
   gk = gradient(func,xk,delta);
   while ( norm(gk) > sc  && k < MAX_EVALS)
       dk = -Hk * gk;
       alpha = golden_ratio(func,prec,0,1,xk,dk);
       xk1 = xk + alpha * dk;
       gk1 = gradient(func,xk1,delta);
       vk = xk - xk1;
       rk = gk - gk1;
       
       Hk1 = Hk + (1/( rk'*vk -rk'*Hk*rk ))  * ((vk - Hk*rk)*(vk - Hk*rk)') ;
       
       k = k+1;
       Hk = Hk1;
       gk = gk1;
       xk = xk1;
   end


end
