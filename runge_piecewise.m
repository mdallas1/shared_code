function runge_piecewise(n)
	%{ 

		Interpolates Runge's function at equally 
		spaced nodes in [-5,5] with piecewise linear 
		interpolation. Note that we obtain a much better approximation 
		than we had with a single interpolant. 

		Note: interp1q is not implemented in Octave. Use interp1. 

	%}
	close all;
	f = @(x) 1./(1+x.^2);
	h = 10/n; nodes = -5:h:5; y = f(nodes);
	t = linspace(-5,5); 
	figure(1)
	hold on; grid on;
	%plot(t,interp1(nodes,y,t),'linewidth',2.0,nodes,y,'o','linewidth',2.0);
	%plot(t,f(t),'--','linewidth',1.5);
	plot(t,interp1(nodes,y,t),'linewidth',2.0)

