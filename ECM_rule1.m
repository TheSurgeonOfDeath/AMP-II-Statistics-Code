% Symbolically plotting normal PDFs for population 0 and population 1.
syms x

% given parameters
sigma = 1;
pi0 = 0.5;
pi1 = 1 - pi0;

% normal pdfs
f0 = normpdf(x,1,sigma);
f1 = normpdf(x,2,2*sigma);

% plot
hold on
fplot(f0,"LineWidth",2)
fplot(f1,"LineWidth",2)

% Shading regions of rule
discrim = 2*sqrt(1 + 6*log(2));
pop0Rule = [(2 - discrim)/3, (2 + discrim)/3];
formataxis;
yl = ylim;
xl = xlim;
area(pop0Rule, repmat(yl(2),1,2),'FaceColor','blue','FaceAlpha', 0.1,'EdgeColor','none');
area([xl(1) pop0Rule(1)], repmat(yl(2),1,2),'FaceColor','red','FaceAlpha', 0.1,'EdgeColor','none');
area([pop0Rule(2) xl(2)], repmat(yl(2),1,2),'FaceColor','red','FaceAlpha', 0.1,'EdgeColor','none');

% Formatting
xlabel('$x$','Interpreter','latex','FontSize',12)
ylabel('Probability Densitiy','Interpreter','latex','FontSize',12)
title('Classification Regions of Populations 0 and 1',...
    'Interpreter','latex','FontSize',14,'FontWeight','bold')
legend('$f_0(x)$', '$f_1(x)$','Population 0','Population 1', 'FontWeight', 'bold','FontSize',...
     12,"Location","northeast",'Interpreter','latex')

hold off


printpdf(gcf, "ECM_rule1_plot.pdf");

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