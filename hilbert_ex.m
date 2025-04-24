% SET SIZE OF SYSTEM
N = 20; err_arr = [];

for n = 1:N
  % CONSTRUCT HILBERT MATRIX H
  v = 0:n-1 ; 
  d = v.*ones(n,1) + [1:n]' ;
  %fprintf("%g x %g Hilbert matrix \n",n,n); 
  H = 1./d ;
  
  % SET EXACT SOLUTION AND RIGHT HAND SIDE  
  x_hat = ones(n,1); b = H*x_hat; 

  % COMPUTE LU FACTORIZATION OF H WITH PARTIAL PIVOTING 
  [L,U,P] = lu(H); 

  % SOLVE TRIANGULAR SYSTEM WITH BACKSLASH 
  y = L \ (P*b); 
  x = U \ y; 

  % COMPUTE RELATIVE ERROR AND ADD TO ARRAY
  err_arr = [err_arr norm(x - x_hat)/norm(x)]; 

  fprintf("Err for n = %g: %.3e \n",n,err_arr(end));
end 

semilogy(1:N,err_arr);

