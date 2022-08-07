syms x
k = -20:5:10;
quadratic = 3*x^2 - 4*x + k;
fplot(quadratic,[2/3-5 2/3+5])

% set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
formataxis;
xlabel('$x$','Interpreter','latex','FontSize',12)
ylabel('$f(x)$','Interpreter','latex','FontSize',12)
title('Shape of $f(x) = 3x^2 - 4x + k$ for different values of $k$',...
    'Interpreter','latex','FontSize',14,'FontWeight','bold')
legendStrings = "$k = " + string(k) + "$";
legend(legendStrings,'FontWeight', 'bold','FontSize', 12,"Location",...
    "northeast",'Interpreter','latex')


printpdf(gcf, "Quadratic_Inequality_plot.pdf");

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
set(gca,'DataAspectRatio',[1 16 1])
set(gca,'xaxislocation','origin','yaxislocation','origin')
% set(gca,'FontSize',10)
% set(gca,'linewidth',2,'box','off')
end