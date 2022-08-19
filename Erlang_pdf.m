% Symbolically finding Erlang PDF for Z
syms z

% given parameters
mu0 = 2;
n = 18;

% erlang distribution
erlang = @(x, mu, k) x.^(k-1).*exp(-x/mu)/(mu.^k.*factorial(k-1));
Zpdf = erlang(z,mu0,n)

% plot
fplot(Zpdf)

% formatting
xlabel('$\theta$','Interpreter','latex','FontSize',12)
ylabel('Power','Interpreter','latex','FontSize',12)
title('Power function for most powerful test of size $\alpha = 0.05$',...
    'Interpreter','latex','FontSize',14,'FontWeight','bold')
legendStrings = "$f_Z(z)$";
legend(legendStrings, 'FontWeight', 'bold','FontSize',...
     12,"Location","northeast",'Interpreter','latex')
xlim([0 70])
ylim([0 0.05])