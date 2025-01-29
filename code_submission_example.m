% From Quarteroni, et al., *Scientific Computing 
% with MATLAB and Octave*, 4th ed, 2014.
%
% 	Problem 1.4: Write the MATLAB instructions to build an upper 
%	(respectively, lower) triangular matrix of dimension 10 having 
%	2 on the main diagonal and −3 on the second upper (respectively, 
%   lower) diagonal.

% A SOLUTION	 
% Define 10x10 diagonal matrix with 2's on main diagonal
A = diag(2*ones(10,1)); 
% Define 10x10 diagonal matrix with -3 on second upper diagonal
B = diag(-3*ones(8,1),2);
% Add A and B to get upper triangular matrix C 
C = A+B;
% Define 10x10 diagonal matrix with -3 on second lower diagonal
B = diag(-3*ones(8,1),-2);
% Add A and B to get lower triangular matrix D
D = A+B; 

disp(C);
disp("");
disp(D);
 



