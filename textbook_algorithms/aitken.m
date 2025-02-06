function [x,niter]=aitken(phi,x0,tol,nmax,varargin) 
% =====================================================================
% The code below is taken from Quarteroni, Saleri, and Gervasio. (2014)
% Scientific Computing with MATLAB and Octave. 4th edition. Springer. 
% It has been modified to be compatible with Octave version 8.2.0. 
% =====================================================================
%AITKEN Aitken ’s method.
% [ALPHA,NITER]=AITKEN(PHI,X0) computes an
% approximation of a fixed point ALPHA of function PHI 
% starting from the initial datum X0 using Aitken’s
% extrapolation method. The method stops after 100 
% iterations or after the absolute value of the
% difference between two consecutive iterates is
% smaller than 1.e-04. PHI is a function handle
% associated with an anonymous function or a function 
% stored in a m-file.
% [ALPHA,NITER]=AITKEN(PHI,X0,TOL,NMAX) allows to
% define the tolerance on the stopping criterion and % the maximum number of iterations .
if nargin == 2
	tol = 1.e-04;
	nmax = 100; 
elseif nargin == 3
	nmax = 100; 
end
x = x0;
diff = tol + 1;
niter = 0;
while niter < nmax && diff >= tol
	gx = phi(x,varargin{:});
	ggx = phi(gx,varargin{:});
	xnew = (x*ggx-gx^2)/(ggx-2*gx+x); diff = abs(x-xnew);
	x = xnew;
	niter = niter + 1;
end
if (niter==nmax && diff>tol)
	fprintf('Fails to converge within maximum number of iterations \n');
end 

% function end
end
