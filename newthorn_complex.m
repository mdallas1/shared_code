%{ 

This script applies Newton-H\"orner to the polynomial 
(x+1)(x-2)(x^2+1) which has two real roots and two 
complext roots. 

Some things to note. To ensure Newton can find the complex 
root, you must choose an x0 with a nonzero imaginary component. 
Octave and MATLAB recognize both i and j as sqrt(-1). 

%} 

addpath('./textbook_algorithms');

fprintf('--------------------------------------------\n');
fprintf('Roots to find:\t -1\t 2\t i\t -i\n');
fprintf('Multiplicity:\t  1\t 2\t 1\t  1\n');
fprintf('--------------------------------------------\n');

a = [1 -1 -1 -1 -2];

[roots,iters] = newton_horner(a,0.25i,1e-8,200)
