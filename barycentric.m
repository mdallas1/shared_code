function [y1]=barycentric(x,y,x1)
% =====================================================================
% The code below is taken from Quarteroni, Saleri, and Gervasio. (2014)
% Scientific Computing with MATLAB and Octave. 4th edition. Springer. 
% It has been modified to be compatible with Octave version 8.2.0. 
% =====================================================================
%BARYCENTRIC Computes the barycentric interpolating 
% Y1=BARYCENTRIC(X,Y,X1) computes the value at the 
% abscissae X1 of the polynomial interpolating data 
% (X,Y), by using barycentric formula. 
np=length(x);
a=min(x); 
b=max(x);
w=ones(np,1);
C=4/(b-a);
for j=1:np
	for k=1:j-1 
		w(j)=w(j)*(x(j)-x(k))*C;
	end
	for k=j+1:np
		w(j)=w(j)*(x(j)-x(k))*C;
	end
end
w=1./w;
num=zeros(size(x1));
den=num; 
exa=num; 
for j=1:np
	xdiff=x1-x(j); 
	wx=w(j)./xdiff; 
	den=den+wx; 
	num=num+wx*y(j); 
	exa(xdiff==0)=j;
end
y1=num./den;
for i=1:length(x1)
	if exa(i)>0 
		y1(i)=y(exa(i)); 
	end 
end

% function end 
end
