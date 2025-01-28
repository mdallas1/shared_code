function [zero,res,niter]=newton(fun,dfun,x0,tol,nmax,varargin)
% =====================================================================
% The code below is taken from Quarteroni, Saleri, and Gervasio. (2014)
% Scientific Computing with MATLAB and Octave. 4th edition. Springer. 
% It has been modified to be compatible with Octave version 8.2.0. 
% =====================================================================
%NEWTON Finds function zeros.
% ZERO=NEWTON(FUN,DFUN,X0,TOL,NMAX) tries to find the 
% zero ZERO of the continuous and differentiable
% function FUN nearest to X0 using the Newton method.
% FUN and its derivative DFUN accept real scalar input
% x and return a real scalar value. If the search
% fails an error message is displayed. FUN and DFUN
% are function handles associated with anonymous fun-
% ctions or Matlab functions .
% ZERO=NEWTON(FUN,DFUN,X0,TOL,NMAX,P1,P2,...) passes
% parameters P1,P2,... to functions: FUN(X,P1,P2,...)
% and DFUN(X,P1,P2,...).
% [ZERO,RES,NITER]=NEWTON(FUN,...) returns the value of
% the residual in ZERO and the iteration number at
% which ZERO was computed .
x = x0; 
fx = fun(x,varargin{:}); 
dfx = dfun(x,varargin{:});
niter = 0; 
diff = tol +1;
while diff >= tol && niter < nmax
	niter = niter + 1; 
	diff = - fx/dfx; 
	x = x + diff; 
	diff = abs(diff); 
	fx = fun(x,varargin {:});
	dfx = dfun(x,varargin{:});
end
if (niter==nmax && diff > tol)
	fprintf(['Newton stopped without converging to the desired tolerance because the maximum\n number of iterations was reached\n']);
end
zero = x; 
res = fx;
%end function
end
