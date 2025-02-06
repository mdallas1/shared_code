function varargout = ex2_1_newt()
	global M v n;
	M = 6000; v = 1000; n = 5; % define parameters for f(r)

		x = 0.3;  % initial iterate 
		tol = 1e-12;  % stop when the error is less than tol 
		err = abs(x); % initial error 
		maxiters = 50;
		iters = 0; 
		y_iters = []; 
		y_iters = [y_iters err];

		fprintf("------------------------------\n")
		fprintf("x_k \t \t |x_k-x_{k-1}|\n")
		fprintf("------------------------------\n")
		fprintf("%.10f \t %0.3e \n",x,err); 
		
		% run Newton method until iterations surpass maxiters or 
		% error is smaller than tol 
		while iters < maxiters && err > tol
			if err < tol
				fprintf("Initial iterate, %f, is a root.\n",c);
				return
			end
			w = - f(x)/df(x);
			x = x + w;
			% loop will terminate when difference between consecutive 
			% steps differ by less than tol
			err = abs(w); 				
			y_iters = [y_iters err];
			fprintf("%.10f \t %0.3e \n",x,err); 
			iters += 1;
		end
		fprintf("==========================\n")
		fprintf("Converged to %0.10f in %g iterations.\n",x,iters);	

		%figure(1)
		%semilogy([1:iters+1],y_iters,'r','LineWidth',1.5);
		%hold on

		varargout{1} = [1:iters+1];
		varargout{2} = y_iters;


	function out = f(r)
		global M v n;
		out = 	M - v * (1+r)./r .* ( (1+r).^n - 1);
	
	function out = df(r) 
		global M v n;
		out = - v * -1/r.^2 .* ( (1+r).^n - 1) - v * (1+r)./r .* n*(1+r).^(n-1);



