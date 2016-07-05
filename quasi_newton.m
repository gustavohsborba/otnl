function [xk, k] = quasi_newton(func, prec, sc, x)
% Gives optimal function point using quasi-newton method

% INPUT:    func  = Function wich we want to calculate optimal value
%           prec  = golden ratio stop condition (precision)
%           sc    = gradient method precision (stop condition)
%           x     = initial evaluation point
% OUTPUT:   xk    = Optimal point found
%           k     = Number of steps to reach optimal point.

   MAX_EVALS = 100000;
   delta = 1e-6;
   beta = 0.5;
   
   [dim, ~] = size(x);
   xk=x;
   
   k=0;
   Hk = eye(dim);
   gk = gradient(func,xk,delta);
   while ( norm(gk) > sc  && k < MAX_EVALS)
       dk = -Hk * gk;
       alpha = golden_ratio(func,prec,0,1,xk,dk);
       xk1 = xk + alpha*dk;
       gk1 = gradient(func,xk1,delta);
       
       vk = xk - xk1;
       rk = gk - gk1;
       
       Cdfp =  ( (vk*vk') / (vk'*rk) ) - ( (Hk*rk*rk'*Hk)/(rk'*Hk*rk) );
       Cbfgs = ( 1 + ( (rk'*Hk*rk)/(rk'*vk) ) ) * ( (vk*vk')/(vk'*rk) ) ...
                - ( (vk*rk'*Hk + Hk*rk*vk')/(rk'*vk) );
       
       Ck = (1-beta)*Cdfp + beta*Cbfgs;
       Hk = Hk + Ck;
       
       k = k+1;
       gk = gk1;
       xk = xk1;
   end


end
