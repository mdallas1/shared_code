function floats(basis,precision,ex_min,ex_max)
	%--------------------------------------------
	%floats(basis,precision,ex_min,ex_max)
	% Prints all positive floating point numbers 
	% in the floating-point set defined by 
	% basis, precision, ex_min, and ex_max. 
	%--------------------------------------------
	b = basis; t = precision; L = ex_min; U = ex_max; 
	A = dec2bin(b^(t-1):b^t-1);
	A = A - '0';
	B = (2.^[t-1:-1:0])';
	C = A*B;
	D = 2.^([L:U]-t);
	E = C * D;
	format short 
	disp(E);	

