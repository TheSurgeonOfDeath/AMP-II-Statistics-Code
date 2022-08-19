% Plotting posterior probability of guilt vs prior probability of guilt
% after each evidence.

% prior probabilities
n = 1000;
priorG = linspace(0,0.5,n);
priorGc = 1 - priorG;

% E1
% likelihoods
likelyE1GivenGc = 0.49;
likelyE1GivenG = 1;

likelyE2GivenGc = 0.18;
likelyE2GivenG = 1;

likelyE3GivenGc = 0.015;
likelyE3GivenG = 1;

% posterior probabilities
postGcGivenE1 = likelyE1GivenGc .* priorGc ./...
    (likelyE1GivenGc .* priorGc + likelyE1GivenG .* priorG);
postGGivenE1 = 1 - postGcGivenE1;

postGcGivenE1andE2 = likelyE2GivenGc .* postGcGivenE1 ./...
    (likelyE2GivenGc .* postGcGivenE1 + likelyE2GivenG .* postGGivenE1);
postGGivenE1andE2 = 1 - postGcGivenE1andE2;

postGcGivenE1E2andE3 = likelyE3GivenGc .* postGcGivenE1andE2 ./...
    (likelyE3GivenGc .* postGcGivenE1andE2 + likelyE3GivenG .* postGGivenE1andE2);
postGGivenE1E2andE3 = 1 - postGcGivenE1E2andE3;

% plot
hold on
plot(priorG, postGGivenE1)
plot(priorG, postGGivenE1andE2)
plot(priorG, postGGivenE1E2andE3)

% formatting
xlabel('$P(G)$ (Prior)','Interpreter','latex','FontSize',12)
ylabel('$P(G|\bigcap_{i=1}^n E_i)$ (Posterior)','Interpreter','latex','FontSize',12)
title('Posterior vs prior probability of guilt after incorporating each evidence',...
    'Interpreter','latex','FontSize',14,'FontWeight','bold')
legend('$n=1$','$n=2$','$n=3$', 'FontWeight', 'bold','FontSize',...
     12,"Location","northeast",'Interpreter','latex')
xlim([0 0.5])
ylim([0 1])
hold off

printpdf(gcf, "Bayes_prior_post_plot.pdf");

function printpdf(h,outfilename)
    set(h, 'PaperUnits','centimeters');
    set(h, 'Units','centimeters');
    pos=get(h,'Position');
    set(h, 'PaperSize', [pos(3) pos(4)]);
    set(h, 'PaperPositionMode', 'manual');
    set(h, 'PaperPosition',[0 0 pos(3) pos(4)]);
    print('-dpdf',outfilename);
end

function formataxis
set(gca,'DataAspectRatio',[16 1 1])
% axis([1.5-5 1.5+5 0 0.41])
ylim([0 1])
% set(gca,'xaxislocation','origin','yaxislocation','origin')
% set(gca,'FontSize',10)
% set(gca,'linewidth',2,'box','off')
end

