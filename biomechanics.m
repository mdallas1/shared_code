function biomechanics()
	%{

		Implementation of biomechanics problem found on page 79 and 107 
		in our book. The goal is to take the data below relating 
		the stress and deformation of a biological tissue, and use our 
		model to estimate the deformation due to a stress of 0.9. 

		The data below is the result of 8 tests. 

		stress | deformation 
		--------------------
		0.00	 0.00
		0.06	 0.08
		0.14	 0.14 
		0.25	 0.20
		0.31	 0.23
		0.47	 0.25
		0.60	 0.28
		0.70	 0.29

	%}

	close all,addpath('./textbook_algorithms');

	x = [0 0.06 0.14 0.25 0.31 0.47 0.60 0.70];
	y = [0 0.08 0.14 0.20 0.23 0.25 0.28 0.29];

	% if n = length(x)-1, polyfit will find a least squares approximation.
	% if n< length(x)-1, it computes the polynomial interpolant. 

	reg_line = polyfit(x,y,1);
	interpolant = polyfit(x,y,length(x)-1);

	t = linspace(0,1); 
	figure(1)
	hold on, grid on 
	plot(t,polyval(reg_line,t),'b','linewidth',2.0);
	plot(t,polyval(interpolant,t),'r-','linewidth',2.0);
	plot(x,y,'ok','linewidth',2.0);


