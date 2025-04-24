function y = crank_nicolson(t0,T,y0,f,N)
    % ==============================
    % CRANK-NICOLSON METHOD SOLVING 
    % CAUCHY PROBLEM y' = f(t,y) 
    % ON [t0,T] with y(0) = y0.
    % N IS THE NUMBER OF NODES.
    % ==============================
    y = zeros(N,1); y(1)=y0; h = (T-t0)/(N-1); 
    nodes = t0:h:T;
    for k = 2:N 
      yprev = y(k-1);
      euler_fun = @(u) u - yprev - 0.5*h*( f(nodes(k),u)+f(nodes(k-1),yprev) );
      y(k) = fsolve(euler_fun,yprev); 
    end 
