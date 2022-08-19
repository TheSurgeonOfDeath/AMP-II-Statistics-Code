% Symbolically plotting normal PDFs for population 0 and population 1.
syms x

% various parameter values
sigma = [0.1 0.5 1 2];
n = length(sigma);

% normal pdfs
f0 = normpdf(x,1,sigma);
f1 = normpdf(x,2,2*sigma);

% plot
t = tiledlayout(2,2, 'TileSpacing', 'compact');
title(t,'PDFs for Populations 0 and 1 given different $\sigma$-values',...
    'Interpreter','latex','FontSize',14,'FontWeight','bold')
for i = 1:n
    nexttile
    hold on
    fplot(f0(i))
    fplot(f1(i))
    hold off

    formataxis;
    xlabel('$x$','Interpreter','latex','FontSize',10)
    ylabel('Probability Densitiy','Interpreter','latex','FontSize',10)
    title("$\sigma = " + num2str(sigma(i)) + "$",...
    'Interpreter','latex','FontSize',12,'FontWeight','bold')
end
hL = legend(nexttile(2),'$f_0(x)$', '$f_1(x)$', 'FontWeight', 'bold','FontSize',...
     12,"Location","northeast",'Interpreter','latex');
hL.Location = 'northeastoutside';


% save plot as pdf
% printpdf(gcf, "ECM_Normal_PDFs_plot.pdf");

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
% set(gca,'DataAspectRatio',[16 1 1])
% axis([1.5-5 1.5+5 0 0.41])
xlim([1.5-5 1.5+5])
% set(gca,'xaxislocation','origin','yaxislocation','origin')
% set(gca,'FontSize',10)
% set(gca,'linewidth',2,'box','off')
end