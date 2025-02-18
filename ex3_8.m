function ex3_8()
	%{ 

		Implements example 3.8 on page 96 of our book. This example 
		demonstrates the phenomenon known as aliasing. 
	
	%}

	close all;

	f1 = @(x) sin(x); f2 = @(x) sin(5*x); f3 = @(x) sin(3*x);
	f = @(x) f1(x) + f2(x);
	ff = @(x) f2(x) - f3(x);
	
	a = 0; b=2*pi; n = 7; h = (b-a)/(n+1);
	nodes = h*[0:n]; y = f(nodes); yy = ff(nodes);
	c = fftshift(fft(y)/(n+1));
	tt = linspace(a,b,100);
	z = interpft(y,100); zz = interpft(yy,100);

	figure(1) 
	hold on; grid on; 
	t = linspace(a,b,1e4);
	plot(t,f(t),'linewidth',2.0);
	%plot(t,trig_interp(t,c,n),'k--','linewidth',2.0)
	plot(tt,z,'-.','linewidth',2.0);
	plot(nodes,y,'o','linewidth',2.0)

	figure(2) 
	hold on; grid on; 
	t = linspace(a,b,1e4);
	plot(t,f2(t),'b--',t,-f3(t),'b','linewidth',2.0);
	plot(nodes,f2(nodes),'o','linewidth',2.0)
	
		
