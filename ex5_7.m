% Step 1: Assemble A
d = [-0.25 -0.5 -0.5 -1*ones(1,4) -2*ones(1,8)];
u2 = [0.1 zeros(1,13)];
u3 = [0.1 0.2 zeros(1,11)];
u4 = [0 0.2 0.2 zeros(1,9)];
u5 = [0 0 0.2 0.4 zeros(1,7)];
u6 = [0 0 0 0.4 0.4 zeros(1,5)];
u7 = [0 0 0 0 0.4 0.4 zeros(1,3)];
u8 = [0 0 0 0 0 0.4 0.4 0];


A = diag(d) + diag(u2,1) + diag(u3,2) + diag(u4,3) + diag(u5,4) + diag(u6,5) + diag(u7,6) + diag(u8,7);
A(7,15) = 0.4;
A = tril(A',-1) + A ;

% Step 2: form right-hand-side b
b = [-5/2 zeros(1,14)]';

% Compute Cholesky. Note that -A is positive definite, but A is not, so we want to solve -Ax = -b.
R = chol(-A); b = -b;

% Solve R^Ty = b using forward subsitution
y = zeros(15,1); y(1) = b(1)/R(1,1);
for i = 2:15
  y(i) = (b(i) - y(1:i-1)' * R(1:i-1,i))/R(i,i);
end

% You can also use the built in command.
% This is the famous backlash operator in Matlab. It will apply the most efficient method to solve the given system.
%y = R' \ b;

% Solve Rx = y using backward subsitution
x = zeros(15,1); x(15) = y(15)/R(15,15);
for i = 14:-1:1
  x(i) = (y(i) - x(i+1:15)' * R(i,i+1:15)')/R(i,i);
end
% Or use the built in command
%x = R \ y


% Investigate sparsity of A 
subplot(1,2,1) 
spy(A) 
subplot(1,2,2) 
spy(R)

fprintf("Nonzero entries in A: %g\n",nnz(A))

fprintf("Nonzero entries in R: %g\n",nnz(R))
