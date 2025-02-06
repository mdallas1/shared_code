function newt_sqrt2()
		x = 1.5;  % initial midpoint
		tol = 1e-8;   % stop when the error is less than tol 
		err = abs(sqrt(2)-x); % initial error
		maxiters = 50;% stop if iterations > maxiters
		iters = 0; % initialize iteration counter
		y_iters = []; % initialize vector to hold err (for plotting)
		y_iters = [y_iters err];
	
		% the next four lines just make the output pretty
		fprintf("--------------------------\n")
		fprintf("c_k \t \t err\n")
		fprintf("--------------------------\n")
		fprintf("%.10f \t %0.3e \n",x,err); 
		iters	
		% run bisection method until iterations surpass maxiters or 
		% error is smaller than tol 
		while iters < maxiters && err > tol
			if err < tol
				fprintf("Initial iterate, %f, is a root.\n",c);
				return
			end
			w = -f(x)/df(x);
			x = x + w;
			err = abs(sqrt(2)-x);	
			y_iters = [y_iters err];
			fprintf("%.10f \t %0.3e \n",x,err); 
			iters += 1
		end
		fprintf("==========================\n")
		fprintf("Converged to %0.10f in %g iterations.\n",x,iters-1);

		%semilogy([1:iters+1],y_iters,'Linewidth',1.5);	
		%title('Newton method applied to $f(x)=x^2-1$');
		%xlabel('iteration');
		%ylabel('error');
		%grid on;


	function out = f(x)
		out = x.^2 - 2 ;
	
	function out = df(x)
		out = 2*x ;
