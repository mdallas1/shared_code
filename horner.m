function [y,b] = horner(a,z) 
% =====================================================================
% The code below is taken from Quarteroni, Saleri, and Gervasio. (2014)
% Scientific Computing with MATLAB and Octave. 4th edition. Springer. 
% It has been modified to be compatible with Octave version 8.2.0. 
% =====================================================================
%HORNER Horner algorithm
% Y=HORNER(a,z) computes
% Y = a(1)*z^n + a(2)*z^(n-1) + ... + a(n)*z + a(n+1) using Horner ’s synthetic division algorithm . 
n = length(a)-1;
b = zeros(n+1,1);
b(1) = a(1);
for j=2:n+1
	b(j) = a(j) + b(j-1)*z;
end
y = b(n+1);
b = b(1:end-1);

% function end
end

