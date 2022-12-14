% Symbolically plotting normal PDFs for population 0 and population 1.
syms x

% given parameters
sigma = 1;

% normal pdfs
f0 = 0.5 * 1/2 * exp(-1/6) * normpdf(x,1,sigma);
f1 = 0.5 * normpdf(x,2,2*sigma);

% plot
hold on
fplot(f0,"LineWidth",2)
fplot(f1,"LineWidth",2)

% Formatting
xlabel('$x$','Interpreter','latex','FontSize',12)
ylabel('Probability Densitiy','Interpreter','latex','FontSize',12)
title('Scaled PDFs for Populations 0 and 1',...
    'Interpreter','latex','FontSize',14,'FontWeight','bold')
legend('$f_0(x)$', '$f_1(x)$','Population 0','Population 1', 'FontWeight', 'bold','FontSize',...
     12,"Location","northeast",'Interpreter','latex')

hold off


printpdf(gcf, "ECM_rule_always_1_plot.pdf");

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
xlim([1.5-5 1.5+5])
% set(gca,'xaxislocation','origin','yaxislocation','origin')
% set(gca,'FontSize',10)
% set(gca,'linewidth',2,'box','off')
end