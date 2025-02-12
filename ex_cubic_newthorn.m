addpath('./textbook_algorithms');

f = @(x) x.^3 - 6*x.^2 + 7*x + 2; 
a = [1 -6 7 2];

[roots,iters] = newton_horner(a,0,1e-8,100)

