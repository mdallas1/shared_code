function ex2_11()
	%{

		This example demonsrates the use of Aitken's method to 
		accelerate linearly converging fixed point iterations. 
		We'll use the textbook's algorithm aitken.m.

	%}

	addpath('./textbook_algorithms');
	close all;

	t = linspace(0,2);
	figure(1)
	hold on	
	plot(t,phi0(t),'b','linewidth',2.0);
	plot(t,phi1(t),'r','linewidth',2.0);
	plot(t,t,'k--','linewidth',2.0);
	legend('phi0','phi1','y=x','location','northwest','fontsize',40);
	

 	% Let's see how these iteration functions behave without Aitkens
	x0 = 2; tol = 1e-10; maxiters = 100; err = tol+1; iters = 0;
	while err > tol && iters < maxiters 
		x0_old = x0;
		x0 = phi0(x0);
		iters += 1; 
		err = abs(x0 - x0_old);
	end

	if err < tol 
		fprintf('phi0 converged to %g in %g iterations\n',x0,iters);
	else 
		fprintf('phi0 did not converge in %g iterations\n',maxiters);
	end

	x1 = 2; err = tol+1; iters = 0; 
	while err > tol && iters < maxiters 
		x1_old = x1;
		x1 = phi1(x1);
		iters += 1; 
		err = abs(x1 - x1_old);
	end

	if err < tol 
		fprintf('phi1 converged to %g in %g iterations\n',x1,iters);
	else 
		fprintf('phi1 did not converge in %g iterations\n',maxiters);
	end

	x0 = 2; x1=x0;
	% Now let's apply Aitken 
	[x0,phi0_iters] = aitken(@(x) phi0(x),x0,tol,maxiters);
	[x1,phi1_iters] = aitken(@(x) phi1(x),x1,tol,maxiters);
		
	fprintf('Aitken phi0 converged to %g in %g iterations\n',x0,phi0_iters);
	fprintf('Aitken phi1 converged to %g in %g iterations\n',x1,phi1_iters);

	function out = f(x)
		out = exp(x).*(x-1);

	function out = phi0(x) 
		out = log(x.*exp(x));
	
	function out = phi1(x)
		out = (exp(x) + x)./(exp(x)+1);
	
