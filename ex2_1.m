function varargout = ex2_1()
	global M v n;
	M = 6000; v = 1000; n = 5; % define parameters for f(r)
	%fplot(@(r) f(r),[0.01,0.3]) % fplot requires a function handle
	%grid on 

	%pause % press any key to continue after plotting

	a = 0.01; b = 0.1; % initial interval
		c = (a+b)/2;  % initial midpoint
		tol = 1e-12;   % stop when the error is less than tol 
		err = abs(b-a); % initial error - we don't know what the exact answer is!
		maxiters = 50;% stop if iterations > maxiters
		iters = 0; % initialize iteration counter
		y_iters = []; % initialize vector to hold err (for plotting)
		y_iters = [y_iters err];
	if f(a)*f(b) > 0
			% Throw error if sign(f(a)) = sign(f(b))
			error("f(a)*f(b) < 0 not met");
		end
		% the next four lines just make the output pretty
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
			err = abs(b-a);	
			y_iters = [y_iters err];
			fprintf("%.10f \t %0.3e \n",c,err); 
			iters += 1;
		end
		fprintf("==========================\n")
		fprintf("Converged to %0.10f in %g iterations.\n",c,iters);	

		%figure(1)
		%semilogy([1:iters+1],y_iters,'b','LineWidth',1.5)
		%hold on

		varargout{1} = [1:iters+1];
		varargout{2} = y_iters;


	function out = f(r)
		global M v n;
		out = 	M - v * (1+r)./r .* ( (1+r).^n - 1);


