function y = bck_euler(t0,T,y0,f,N)
  % ==============================
  % BACKWARD EULER METHOD SOLVING 
  % CAUCHY PROBLEM y' = f(t,y) 
  % ON [t0,T] with y(0) = y0.
  % N IS THE NUMBER OF NODES.
  % ==============================
  y = zeros(N,1); y(1)=y0; h = (T-t0)/(N-1); 
  nodes = t0:h:T;
  for k = 2:N 
    yprev = y(k-1);
    euler_fun = @(u) u - yprev - h * f(nodes(k),u);
    y(k) = fsolve(euler_fun,yprev);
  end 
