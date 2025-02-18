function ex3_7(n)
	%{ 

		Implementation of Example 3.7 on page 96 of our book demonstrating
		trigonometric interpolation. 

	%} 

	close all;

	f = @(x) x.*(x-2*pi).*exp(-x);
	a = 0; b = 2*pi; n = n; h = (b-a)/(n+1);
	nodes = h *[0:n]; y = f(nodes);	

	C = fft(y)/(n+1); 
	c = fftshift(C); % fftshift puts orders the coefficients like (c_{-(M+1)},...,c_{-1},c_0,...,c_M). The coefficient c_{M+1} is ommitted.  
	
	figure(1) 
	hold on; grid on;
	t = linspace(a,b,1e4); tt=2*pi/1000*[0:999];
	plot(t,f(t),'--','linewidth',2.0);
	plot(nodes,y,'o','linewidth',2.0);
	%plot(tt,interpft(y,1000),'linewidth',2.0); %interpft automatically plots interpolant
	plot(t,trig_interp(t,c,n),'linewidth',2.0)

		 
