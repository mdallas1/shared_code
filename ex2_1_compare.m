[k_b,err_b] = ex2_1; 
[k_n,err_n] = ex2_1_newt;

figure(1)
semilogy(k_b,err_b,'b','LineWidth',1.5);
hold on
semilogy(k_n,err_n,'r','LineWidth',1.5);
xlabel('Iteration','FontSize',13);
legend('Bisection','Newton','FontSize',13);
yticks([1e-16 1e-14 1e-12 1e-10 1e-8 1e-6 1e-4 1e-2 1]);
set(gca,'FontSize',14)
figure(1)

