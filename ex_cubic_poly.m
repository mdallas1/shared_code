function ex_cubic_poly(x0)
	% The function defined below demonstrates the 
	% sensitivity of Newton's method to the choice 
	% of initial iterate x0. 
	% A so called ``Newton Cycle" occurs for x0 = 1.
	x = x0;	tol = 1e-12;
	err = abs(f(x)); iters = 0; maxiters = 50;
	
	fprintf("--------------------------\n")
	fprintf("x_k \t \t err\n")
	fprintf("--------------------------\n")
	fprintf("%.10f \t %0.3e \n",x,err);

	while iters < maxiters && err > tol
		w = - f(x)/df(x);
		x = x + w; 
		err = abs(f(x));
		fprintf("%.10f \t %0.3e \n",x,err);
		iters += 1; 
	end	
	fprintf("==========================\n")
	if err < tol
		fprintf("Converged to %0.10f in %g iterations.\n",x,iters);
	else 
		fprintf("Did not converge.\n")
	end	
	

	function out = f(x) 
		out = x.^3 - 6*x.^2+7*x+2;
	
	function out = df(x)
		out = 3*x.^2 - 12*x+7;

