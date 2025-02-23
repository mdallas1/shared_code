%{ 

This script applies Newton-H\"orner to a cubic and 7th degree 
polynomial. The cubic polynomial has simple root 0 and root 
1 of multiplicity m=2. The 7th degree polynomial has roots 
-3, -1, 1, and 4. The roots -1 and 4 have multiplicity m=2 and m=3 
respectively, while -3 and 1 are simple roots. 

Some things to note. We're still ultimately using Newton's method, 
so we can expect the perfomance to vary with our choice of initial 
iterate x0. 

%} 

addpath('./textbook_algorithms');

fprintf('------------------------------------------\n');
fprintf('Roots to find:\t 0\t 1\n');
fprintf('Multiplicity:\t 1\t 2\n');
fprintf('------------------------------------------\n');

a = [1 -2 1 0];

[roots,iters] = newton_horner(a,0.25,1e-12,200)

fprintf('------------------------------------------\n');
fprintf('Roots to find:\t -3\t -1\t 1\t 4\n');
fprintf('Multiplicity:\t  1\t  2\t 1\t 3\n');
fprintf('------------------------------------------\n');

a = [1 -8 2 100 -115 -284 112 192];

[roots,iters] = newton_horner(a,10,1e-12,200)
