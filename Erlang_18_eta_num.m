syms eta z lambda1 c

% given parameters
mu0 = 2;
n = 18;

% erlang distribution
erlang = @(x, mu, k) x.^(k-1).*exp(-x/mu)/(mu.^k.*factorial(k-1));
Zpdf = erlang(z,mu0,n);

I = int(Zpdf,z,eta,inf)

eta = vpasolve(0.05 == I)
c = solve(eta == 18 * log(c * lambda1/2) / (1/2 - 1/lambda1),c)

