function ex4_2()
	%{ 

		Implementation of example 4.2 on page 122. Goal is to estimate 
		number of individuals whose heights are between 1.8 and 1.9 m 
		by integrating the height distribution function, which in this 
		case is a normal distribution. 	
	
	%} 

	close all

	% this lets us code textbook code
	addpath('./textbook_algorithms');
	
	% define various parameters
	M = 200; hbar = 1.7; sigma = 0.1; 

	% define height distribution
	n = @(s) ( M / (sigma*sqrt(2*pi)) ) * exp(-(s-hbar).^2/(2*sigma^2));

	% interval to integrate over and number of subintervals
	a = 1.8; b = 1.9; M = 100;

	% integrate with midpoint quadrature with textbook program 
	Im = midpointc(a,b,M,n); 

	% integrate with trapezoid quadrature using Octave program
	nodes = a:(b-a)/M:b; y = n(nodes);	
	It = trapz(nodes,y); 

	% integrate with composite Simpson quadrature using textbook program
	Is = simpsonc(a,b,M,n);	
	
	format long
	fprintf("M = %g\n------------------------------\nComposite Midpoint:  %0.8g\nComposite Trapezoid: %0.8g\nComposite Simpson:   %0.8g\n", M,Im,It,Is);

	% compare convergence rates 
	mm = [1 10 20 30 40 50 60 70 80 90 100];
	Im = []; It = []; Is = [];
	for M = mm
		
		Im = [Im midpointc(a,b,ceil(M),n)]; 
	
		nodes = a:(b-a)/M:b; y = n(nodes); 
		It = [It trapz(nodes,y)]; 

		Is = [Is simpsonc(a,b,M,n)]; 

	end 		

	% approximate true integral 
	Itrue = simpsonc(a,b,1e8,n);
		
	figure(1), hold on, grid on 
	loglog((b-a)./mm,abs(Im-Itrue),'s-','linewidth',2.0); 
	loglog((b-a)./mm,abs(It-Itrue),'+-','linewidth',2.0);
	loglog((b-a)./mm,abs(Is-Itrue),'*-','linewidth',2.0);
	loglog((b-a)./mm,((b-a)./mm).^2 * 50,'k--','linewidth',2.0);
	loglog((b-a)./mm,((b-a)./mm).^4 * 10,'k-.','linewidth',2.0);
	legend('Midpoint','Trapezoid','Simpson','H^2','H^4','location','northwest');
	yticks([1 1e-4 1e-8 1e-12]);
	set(gca,'fontsize',40)
			
	
	
