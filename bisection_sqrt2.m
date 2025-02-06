function bisection_sqrt2()
		a = 1; b = 2; % initial interval
		c = (a+b)/2;  % initial midpoint
		tol = 1e-7;   % stop when the error is less than tol 
		err = abs(sqrt(2)-c); % initial error
		maxiters = 22;% stop if iterations > maxiters
		iters = 0; % initialize iteration counter
		y_iters = []; % initialize vector to hold err (for plotting)
		y_iters = [y_iters err];
		if f(a)*f(b) > 0
			% Throw error if sign(f(a)) = sign(f(b))
			error("f(a)*f(b) < 0 not met");
		end
		% the next three lines just make the output pretty
		fprintf("--------------------------\n")
		fprintf("c_k \t \t err\n")
		fprintf("--------------------------\n")
		fprintf("%.10f \t %0.3e \n",c,err); 
		
		% run bisection method until iterations surpass maxiters or 
		% error is smaller than tol 
		while iters < maxiters && err > tol
			if err < tol
				fprintf("Initial midpoint, %f, is a root.\n",c);
				return
			end
			if f(a)*f(c) < 0 
				a = a; 
				b = c;
			elseif f(b)*f(c) < 0 
				a = c;
				b = b;
			end
			c = (a+b)/2;
			err = abs(sqrt(2)-c);	
			y_iters = [y_iters err];
			fprintf("%.10f \t %0.3e \n",c,err); 
			iters += 1
		end
		fprintf("==========================\n")
		fprintf("Converged to %0.10f in %g iterations.\n",c,iters);
		
		%semilogy([1:iters+1],y_iters,'Linewidth',1.5);	
		%title('Bisection method applied to $f(x)=x^2-1$');
		%xlabel('iteration');
		%ylabel('error');
		%grid on;

	function out1 = f(x)
		out1 = x.^2 - 2;
