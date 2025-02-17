function runge_function(n) 

	%{ 

		Demonstrates how the error of the Lagrange interpolant 
		increases near the end points if nodes are equally 
		spaced. 
		
		The input n is the degree of the interpolant.

	%} 

	close all;

	% form interpolant and plot
	a = -5; b = 5; h = (b-a)/n ; nodes = a:h:b; y = runge(nodes);
	p = polyfit(nodes,y,n); 
	t = linspace(a,b,1e4);

	figure(1) 
	plot(t,runge(t),'b','linewidth',2.0);
	title("Runge's Function (Witch of Agnesi)",'fontsize',30);
	grid on;
	
	figure(2)
	hold on;
	plot(nodes,y,'ok','linewidth',2.0); 
	plot(t,polyval(p,t),'b','linewidth',2.0); 
	plot(t,runge(t),'k--','linewidth',2.0);
	grid on;

	% investigate error 
	pkg load symbolic ;
	syms x ;
	f = 1/(1+x^2); 
	
	% matlabFunction turns symbolic expressions into function handles. 
	df = matlabFunction(diff(f,x,n+1)); 
	
	% Uncomment following lines to see (n+1)st derivative. 
	%figure(2) 
	%fplot(df,[-5,5]);

	max_df = max(df(t))
	c = poly(nodes); 		
	max_w = max(polyval(c,t))/factorial(n+1)
	En = max_df * max_w

	% Now interpolate with Chebyshev nodes 
	z = (2*[0:n]+1)./(2*n+2);
	cheby_nodes = L(cos(pi*z),a,b);
	p = polyfit(cheby_nodes,runge(cheby_nodes),n);
	figure(3)
	hold on;
	plot(t,runge(t),'k--','linewidth',2.0);
	plot(t,polyval(p,t),'b','linewidth',2.0);
	plot(cheby_nodes,runge(cheby_nodes),'ok','linewidth',2.0);
	grid on;

	% figure(4) plots the Chebyshev nodes on the x axis in [-1,1]
	% on maps them on the unit circle. Note that they are equally 
	% spaced on the unit circle, but not in [-1,1]. 
	tt = linspace(-1,1,1e4);
	figure(4)
	hold on; grid on;
	cheby_nodes_1 = cos(pi*z);
	plot(cheby_nodes_1,sqrt(1-cheby_nodes_1.^2),'o','linewidth',2.0);
	plot(cheby_nodes_1,zeros(1,length(cheby_nodes_1)),'*','linewidth',2.0);
	plot(tt,sqrt(1-tt.^2),'linewidth',2.0);
		

	function out = runge(x)
		out = 1./(1+x.^2);

	function out = L(x,a,b)
		out = .5*(a+b) + 0.5*(b-a)*x;


	
