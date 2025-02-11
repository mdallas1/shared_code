function ex2_9()
	%{ 
	
	This function implements example 2.9 on page 61 of our book. 
	We consider two different models of population dynamics, and 
	we apply a fixed point iteration to determine the equilibrium 
	populations. See also Problem 2.4 on page 42. 	

	Key observations: 
		(1) A fixed point iteration succesfully finds at least one 
			equilibrium population for each model. 
		(2) Convergence to these fixed points is linear. This is 
			consistent with our convergence theory. 
		(3) Not all equilibrium populations can be found with a fixed 
			point iteration. This is explained again by the theory. 

	%}

	close all;
		
	global r K
	r = 3; K = 1; 

	% Let's see what our iteration functions look like. 
	figure(1)
	hold on; grid on;
	fplot(@(x) phiV(x),[0,10],'b','LineWidth',1.5);
	fplot(@(x) phiP(x),[0,10],'r','LineWidth',1.5);
	fplot(@(x) x, [0,5],'k--','LineWidth',1.5);
	legend('Verhulst','Predator-Prey','y=x','FontSize',20,'location','northwest');
	xlabel('Generation','FontSize',20);
	ylabel('Population','FontSize',20);
	set(gca,'FontSize',20);	
	figure(1)

	pause()

	maxiters = 100; tol = 1e-8; err = 1; iters = 0; 
	v_err = []; p_err = [];

	% initial guesses
	x_v = 1; 
	x_p = x_v;

	% Verhulst model
	while iters < maxiters && err > tol 
		oldx = x_v;
		x_v = phiV(x_v); 
		err = abs(x_v-oldx);
		v_err = [v_err err];
		iters += 1;
	end		
	v_iters = [1:iters]; iters = 0; err = 1;	
	
	% Predator-prey model
	while iters < maxiters && err > tol 
		oldx = x_p;
		x_p = phiP(x_p); 
		err = abs(x_p - oldx);
		p_err = [p_err err];
		iters += 1;
	end
	p_iters = [1:iters];

	figure(1)
	plot(x_v,phiV(x_v),'bo','LineWidth',1.5);
	plot(x_p,phiP(x_p),'ro','LineWidth',1.5);
	legend('Verhulst','Pred-prey','y=x','Verhulst fp','Pred-prey fp','FontSize',20,'location','northwest');


	figure(2)
	hold on
	semilogy(v_iters,v_err,'LineWidth',1.5);
	semilogy(p_iters,p_err,'LineWidth',1.5);
	legend('Verhulst err','Pred-prey err','fontsize',20)
	xlabel('Iteration','FontSize',20);

	if p_err(end) < tol && v_err(end) < tol 
		fprintf('Both solves converged and found Verhulst fixed point %g and Predator-Prey fixed point %g.\n',x_v,x_p);
	end
		

	% define models 
	function out = phiV(x)
		global r K
		out = r*x ./ (1 + x*K);
	
	function out = phiP(x)
		global r K
		out = r * x.^2 ./ (1 + (x/K).^2);

