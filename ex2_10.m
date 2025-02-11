function ex2_10()
	%{ 

	Implementation of ex2_10 on page 63 of our book. Here we apply 
	Newton's method to approximate the root alpha = 1 of 
	f(x) = (x-1)^{(m-1)}\log(x) with m=11 and m=21. In each case, 
	alpha = 1 has multiplicity m. 

	Key Observations: 
		(1) When m=21, we see slower convergence than when m=11. 
		(2) Also when m=21, we see that our error estimator, 
			the difference between consecutvie iterates, is less 
			accurate than when m=11. 
	
	Each of these observations is explained by our theory that says 
	the asymptotic convergence rate is phi'(x) = 1-1/m. 	

	%} 

	close all;

	maxiters = 500; iters = 0; tol = 1e-8; err = 1; 
	x_err = []; y_err = []; true_xerr = []; true_yerr=[];

	x = 2;

	% m = 11 
	while iters < maxiters && err > tol 
		oldx = x;
		x = phi(x,11);
		err = abs(x-oldx);
		x_err = [x_err err];
		true_xerr = [true_xerr abs(x-1)];
		iters += 1;
	end

	y = 2; x_iters = [1:iters]; iters = 0; err = 1;

	% m = 21	
	while iters < maxiters && err > tol 
		oldy = y;
		y = phi(y,21);
		err = abs(y-oldy);
		y_err = [y_err err];
		true_yerr = [true_yerr abs(y-1)];
		iters += 1;
	end

	y_iters = [1:iters];

	figure(1)
	hold on; 
	semilogy(x_iters,x_err,'b--','linewidth',1.5);
	semilogy(y_iters,y_err,'r--','linewidth',1.5);
	semilogy(x_iters,true_xerr,'b','linewidth',1.5);
	semilogy(y_iters,true_yerr,'r','linewidth',1.5);
	legend('m=11 approx err','m=21 approx err','m=11 true err', 'm=21 true err','fontsize',20);
	xlabel('Iteration');
	set(gca,'fontsize',20);
	figure(1)
		


	function out = phi(x,m)
		out = x - ((x-1).^(m-1).*log(x)) ./ ((m-1)*(x-1).^(m-2)*log(x)+(x-1).^(m-1)./x);
	
				
