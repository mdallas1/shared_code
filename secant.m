function [alpha,varargout] = secant(x0,x1,f,tol,maxiters,varargin)
	%SECANT(x0,x1,f,tol,maxiters)
	% Attempts to find a root of the function f given initial 
	% iterates x0 and x1. Terminates after iterates exceed 
	% maxiters or if the difference between consecutive iterates 
	% is less than tol. 
	% To see convergence history displayed in command window like 
	% in the previous examples, type 'report' after tol when you 
	% call SECANT, e.g., >>> secant(1,2,f,50,1e-8,'report') ;  
	% [ROOT,ITER_ARR,ERR_ERR] = SECANT(...) returns the root, 
	% and the arrays containing the iteration count and error 
	% per iteration. Use this if you'd like to plot the convergence 
	% history. 
	if !is_function_handle(f)
		error('function argument must be a function handle.');
	end

	iters = 0; err = 1; tol = tol; 
	maxiters = maxiters; err_arr = [];
	x0 = x0; x1 = x1; 

	if nargin > 5
		fprintf("------------------------------\n")
		fprintf("x_k \t \t |x_k-x_{k-1}|\n")
		fprintf("------------------------------\n")
	end
		

	while iters < maxiters && err > tol 
		fx0 = f(x0); fx1 = f(x1); % function evals can be expensive. Just do them once. 
		w = -(x1-x0)/(fx1-fx0) * fx1;
	
		x0 = x1; % need to update x0 and x1
		x1 = x1 + w;

		err = abs(w);
		err_arr = [err_arr err];

		if nargin > 5
			fprintf("%.10f \t %0.3e \n",x1,err);
		end
			
		iters += 1; 
	end

	if nargin > 5 && err < tol 
		fprintf("==========================\n")
		fprintf("Secant method converged to %0.10f in %g iterations.\n",x1,iters);
	elseif nargin > 5 
		fprintf("==========================\n")
		fprintf("Secant method did not converge in %g iterations.\n",maxiters);
	end
	
	
	alpha = x1;		
	varargout{1} = [1:iters];
	varargout{2} = err_arr;
	
	 
	
	
	
	
