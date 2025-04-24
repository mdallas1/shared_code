close all;
f = @(t,y) cos(2*y); 
y_true = @(t) 0.5*asin( (e.^(4*t) - 1)./(e.^(4*t)+1) );
t = linspace(0,1); 

N = 20; t0 = 0; T = 1; nodes = t0:(T-t0)/(N-1):T;
y_fe = fwd_euler(0,1,0,f,N);
y_be = bck_euler(0,1,0,f,N);
y_cn = crank_nicolson(0,1,0,f,N);

fe_err = max(abs(y_fe' - y_true(nodes)))
be_err = max(abs(y_be' - y_true(nodes)))

% COPY INTO M FILE TO PLOT SOLUTIONS 
figure(1), hold on, grid on
plot(t,y_true(t),'linewidth',1.5,'r--');
plot(nodes,y_fe,'linewidth',1.5,'b-*');
plot(nodes,y_be,'linewidth',1.5,'k-o');
plot(nodes,y_cn,'linewidth',1.5,'m-o');
