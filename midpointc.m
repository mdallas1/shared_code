function Imp=midpointc(a,b,M,fun,varargin)
% =====================================================================
% The code below is taken from Quarteroni, Saleri, and Gervasio. (2014)
% Scientific Computing with MATLAB and Octave. 4th edition. Springer. 
% It has been modified to be compatible with Octave version 8.2.0. 
% =====================================================================
%MIDPOINTC Composite midpoint numerical integration.
% IMP = MIDPOINTC(A,B,M,FUN) computes an approximation 
% of the integral of the function FUN via the midpoint 
% method (with M equal subintervals). FUN accepts a
% real vector input x and returns a real vector value. 
% FUN can be either an inline function, an anonymous
% function, or it can be defined by an external m-file. 
% IMP=MIDPOINTC(A,B,M,FUN,P1,P2,...) calls the function 
% FUN passing the optional parameters P1,P2,... as
% FUN(X,P1,P2,...).
H=(b-a)/M;
x = linspace(a+H/2,b-H/2,M); fmp=fun(x,varargin{:}).*ones(1,M);
Imp=H*sum(fmp);

