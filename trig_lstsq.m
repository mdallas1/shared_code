function trig_lstsq(n)
	
	close all

	x_full = [-55:10:65]';
	y_full = [-3.25 -3.37 -3.35 -3.2 -3.12 -3.02 -3.02 -3.07 -3.17 -3.32 -3.3 -3.22 -3.1]';

	B = ones(length(x_full),1);
	for i = 1:n	
		B = [B cos(pi/60 * x_full * i)];
	end

	a = B \ y_full; 

	t=linspace(-60,70);
	figure(1)
	hold on, grid on
	plot(t,ff(t,a,n));
	plot(x_full,y_full,'o')

	function out = ff(x,a,n)
		y = a(1);
		for i = 1:n
			y += a(i+1)*cos(pi/60 * x * i);
		end
		out = y;
			
	

