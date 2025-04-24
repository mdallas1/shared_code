function y = fwd_euler(t0,T,y0,f,N)
  % ==============================
  % FORWARD EULER METHOD SOLVING 
  % CAUCHY PROBLEM y' = f(t,y) 
  % ON [t0,T] with y(0) = y0.
  % N IS THE NUMBER OF NODES.
  % ==============================
  y = zeros(N,1); y(1)=y0; h = (T-t0)/(N-1); 
  nodes = t0:h:T;
  for k = 2:N 
    yprev = y(k-1);
    y(k) = yprev + h * f(nodes(k-1),yprev); 
  end 
