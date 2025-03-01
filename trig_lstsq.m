function trig_lstsq(n)
	
	close all,addpath('./textbook_algorithms')

	x_full = [-55:10:65]';
	y_full = [-3.25 -3.37 -3.35 -3.2 -3.12 -3.02 -3.02 -3.07 -3.17 -3.32 -3.3 -3.22 -3.1]';

	length(x_full)
	% form matrix of basis functions
	B = ones(length(x_full),1);
	for i = 1:n	
		B = [B cos(pi/60 * x_full * i)];
	end

	% uncomment to see the condition number of the (B^TB)^{-1} 
	 fprintf('Condition number of B^TB: %g\n',rcond(B'*B));

	% solve normal equations with the magic backslash operator
	%a = B \ y_full; 
	a = (B'*B) \ (B'*y_full);

	% let's see how a least squares fit with a deg 4 polynomial compares
	c = polyfit(x_full,y_full,4);

	t=linspace(-60,70);
	figure(1)
	hold on, grid on
	plot(x_full,y_full,'o','linewidth',2.0)
	plot(t,ff(t,a,n),'linewidth',2.0);
	plot(t,polyval(c,t),'--','linewidth',2.0);
	title('Comparing Trigonometric and Polynomial Least Sqr fits','fontsize',20);
	legend('data points','Cosine polynomial','deg 4 polynomial','location','northwest','fontsize',15);

	fprintf('Squared Error: %g\n',sum((ff(x_full,a,n)-y_full).^2))

	function out = ff(x,a,n)
		y = a(1);
		for i = 1:n
			y += a(i+1)*cos(pi/60 * x * i);
		end
		out = y;
			
	

