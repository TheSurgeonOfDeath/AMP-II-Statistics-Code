% Numerically solving for optimal value of k for a test of size alpha=0.05
syms theta
B = @(theta,k) (1 + k/theta) .* exp(-k/theta);
k_num = [vpasolve(0.05 == B(2,k)) vpasolve(0.05 == B(2,k),10) 0]
k_num = double(k_num);

% power function
B = (1 + k_num/theta) .* exp(-k_num/theta);
trueTheta = 2;

% plot
hold on
fplot(B)
xline(2,"Linestyle","--","Label","$\theta = 2$","Interpreter","latex", ...
    "LabelVerticalAlignment","middle","LabelHorizontalAlignment","left")

% formatting
xlabel('$\theta$','Interpreter','latex','FontSize',12)
ylabel('Power','Interpreter','latex','FontSize',12)
title('Power function for most powerful test of size $\alpha = 0.05$',...
    'Interpreter','latex','FontSize',14,'FontWeight','bold')
legendStrings = "$k = " + string(round(k_num,3)) + "$";
legend(legendStrings, 'FontWeight', 'bold','FontSize',...
     12,"Location","northeast",'Interpreter','latex')
xlim([0 5])
ylim([0 1])
hold off

printpdf(gcf, "Erlang_most_powerful_plot.pdf");

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
