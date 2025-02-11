close all;
M = 6000; v = 1000; n = 5;
f = @(r) M - v * (1+r)./r .* ( (1+r).^n - 1);
	
[k_b,err_b] = ex2_1; 
[k_n,err_n] = ex2_1_newt;
[~,k_s,err_s] = secant(0.3,-0.3,f,50,1e-12,'report');

figure(1)
hold on
semilogy(k_b,err_b,'b','LineWidth',1.5);
semilogy(k_n(1:end-1),err_n(2:end),'r','LineWidth',1.5);
semilogy(k_s,err_s,'k','LineWidth',1.5);
xlabel('Iteration','FontSize',20);
legend('Bisection','Newton','Secant','FontSize',20);
yticks([1e-16 1e-14 1e-12 1e-10 1e-8 1e-6 1e-4 1e-2 1]);
set(gca,'FontSize',20)
figure(1)

