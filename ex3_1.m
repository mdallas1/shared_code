function ex3_1()
	%{ 

		Implements example 3.1 on page 83 of our book. We interpolate 
		data from climatology. 

		We'll work with the following data which records 
		the variation in the average yearly temperature at different 
		latitudes for concentration K = 0.67 of carbonic acid.

		Latitude	Temp variation	
		--------------------------
		65			-3.1
		55			-3.22
		45			-3.3
		35			-3.32
		25			-3.17
		15			-3.07	
		 5			-3.02
		-5			-3.02
	   -15			-3.12
	   -25			-3.2
	   -35			-3.35
	   -45			-3.37
	   -55			-3.25

	%}

	close all;

	% use only the following subset of the data
	x_full = [-55:10:65];
	y_full = [-3.25 -3.37 -3.35 -3.2 -3.12 -3.02 -3.02 -3.07 -3.17 -3.32 -3.3 -3.22 -3.1];
	x = [-55 -25 5 35 65]; 
	y = [-3.25 -3.2 -3.02 -3.32 -3.1];
	
	% get the coefficients for the deg 4 interpolating polynomial
	c = polyfit(x,y,4);
	
	% plot nodes and interpolant 
	t = linspace(x(1),x(end));
	figure(1) 
	hold on; grid on; 
	%plot(t,polyval(c,t),'linewidth',2.0);
	plot(x_full,y_full,'o','linewidth',2.0);
		
	
		

	
