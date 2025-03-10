function ex4_1()
	%{ 

		Implements example 4.1 on page 117 of our book. The goal 
		is to approximate the emptying velocity of a fluid exiting a 
		cylinder, and compare the computed value to the value given by 
		the empirical Torricelli's law. 
	
	%} 

	% values of q(t) sampled every 5 seconds 
	t = [0 5 10 15 20]; 
	qt = [0.6350 0.5336 0.4410 0.3572 0.2882]; 

	% true values of q'(t) from Torricelli's law
	dqt_true = [-0.0212 -0.0194 -0.0176 -0.0159 -0.0141]; 
	
	% FINITE DIFFERENCES

	% we're stuck with h = 5
	h = 5;
	fwd_diff  = ( qt(2:end) - qt(1:end-1) ) / h; 
	bck_diff = fwd_diff;
	ctrd_diff = ( qt(3:end) - qt(1:end-2) ) / (2*h);
	
	fprintf("t  \t  %g \t|\t %g \t|\t %g \t|\t %g \t|\t %g\n",t'(1:end));
	fprintf("----------------------------------------------------------------------------\n");
	fprintf("q'(t) %5g \t     %5g \t     %5g \t     %5g \t     %5g\n",dqt_true'(1:end));
	fprintf("----------------------------------------------------------------------------\n");
	fprintf("FWD  %9g \t   %9g \t   %9g \t   %9g \t\t  --\n",fwd_diff'(1:end));
	fprintf("----------------------------------------------------------------------------\n");
	fprintf("BCK \t -- \t   %9g \t   %9g \t   %9g \t   %9g\n",bck_diff'(1:end));
	fprintf("----------------------------------------------------------------------------\n");
	fprintf("CTR \t -- \t   %9g \t   %9g \t   %9g \t\t -- \n\n",ctrd_diff'(1:end)); 


