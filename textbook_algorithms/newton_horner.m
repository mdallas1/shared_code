function [roots,iter]=newton_horner(a,x0,tol,nmax) 
% =====================================================================
% The code below is taken from Quarteroni, Saleri, and Gervasio. (2014)
% Scientific Computing with MATLAB and Octave. 4th edition. Springer. 
% It has been modified to be compatible with Octave version 8.2.0. 
% =====================================================================
%NEWTONHORNER Newton -Horner method
% [ROOTS,ITER]=NEWTONHORNER(A,X0) computes the roots of
% polynomial
% P(X)= A(1)*X^N + A(2)*X^(N-1) + ... + A(N)*X + A(N+1)
% using the Newton-Horner method starting from the
% initial guess X0. The method stops for each root
% after 100 iterations or after the absolute value of
% the difference between two consecutive iterates is
% smaller than 1.e-04.
% [ROOTS,ITER]=NEWTONHORNER(A,X0,TOL,NMAX) allows to
% define the tolerance on the stopping criterion and
% the maximum number of iterations . 
if nargin == 2
	tol = 1.e-04; nmax = 100;
elseif nargin == 3
	nmax = 100; 
end
n=length(a)-1; 
roots = zeros(n,1); 
iter = zeros(n,1); 
for k = 1:n
% Newton iterations
	niter = 0; 
	x = x0; 
	diff = tol + 1; 
	while niter < nmax && diff >= tol
		[pz,b] = horner(a,x); 
		[dpz,b] = horner(b,x); 
		xnew = x - pz/dpz; 
		diff = abs(xnew-x); 
		niter = niter + 1; 
		x = xnew;
	end
	if (niter==nmax && diff> tol)
	fprintf("Fails to converge within maximum number of iterations \n");
	end
	% Deflation
	[pz,a] = horner(a,x); roots(k) = x; iter(k) = niter;
end

% function end 
end
