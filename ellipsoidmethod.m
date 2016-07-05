function  [xk, k] = ellipsoidmethod( func, prec, delta, x )
% Gives optimal function point using Ellipsoidal method
% INPUT:    func  = Function wich we want to calculate optimal value
%           prec  = stop condition (precision)
%           delta = gradient method precision (stop condition)
%           x     = initial evaluation point
% OUTPUT:   xk    = Optimal point found
%           k     = Number of steps to reach optimal point.
   
   dim = size(x, 1);
   b1 = 1/(dim+1);
   b2 = dim^2 / ((dim^2) - 1);
   b3 = 2 / (dim + 1);
   
   k=1;
   Qk = eye(dim).*10; % Eye Matrix for initial region
   xk=x;  
   V = Inf;
   while ( V > prec )
       [~, ~, index] = restrictions(xk);
       if index == 0
          gk = gradient(func,xk,delta );
       else
          rest = ['g' int2str(index)];
          gk = gradient(rest,xk,delta );
       end 
       
       Qk1 = b2 * (Qk - (b3*(Qk*gk)*(Qk*gk)')/(gk'*Qk*gk) );
       xk1 = xk - b1*((Qk*gk)/((gk'*Qk*gk)^(1/2)));
       
       k = k+1;
       xk = xk1;
       Qk = Qk1;
       V = pi*det(sqrt(Qk));
       
   end
   
end

