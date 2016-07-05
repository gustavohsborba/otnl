function alpha = golden_ratio(func,prec,a,b,x,d)
% Golden Ratio mono-objective optimization method
% Given an [a, b] interval, an x point and a direction d
% Optimizes func by successively narrowing the range of values 
% inside [a,b] which the extremum is known to exist.
% In this case, we want arg min(alpha) f = func(xk + alpha*dk)

% INPUT:   func  = function wich we want to optimize.
%          prec  = precision
%          a     = begin of interval section
%          b     = end of interval section
%          x     = evaluation point value
%          d     = function eval direction
% OUTPUT:  alpha = optimum alpha value

   while (b-a) > prec
      xa = b - 0.618 * (b-a);
      xb = a + 0.618 * (b-a);
      fa = feval(func,x+xa*d);
      fb = feval(func,x+xb*d);
      if (fa < fb)
          b = xb;
      else
          a = xa;
      end
   end   
    alpha=(a+b)/2;
end

 