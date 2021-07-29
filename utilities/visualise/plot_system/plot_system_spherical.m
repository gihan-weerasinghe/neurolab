GCF_POS=[140    37   989   969];
show_legend=0;

plot_system(P,Ppp);

hold on

[x y z] = sphere(128);
h = surf(x, y, z,'EdgeColor','none','FaceColor','red');
set(h, 'FaceAlpha', 0.025)
hold off

Lbox=1.3;

xlim([-Lbox,Lbox]);
ylim([-Lbox,Lbox]);
zlim([-Lbox,Lbox]);
xlabel('x');
ylabel('y');
zlabel('z');
title(['$\eta= $',num2str(eta)],'interpreter','latex','FontSize',45);
set(gcf, 'Position', GCF_POS);

if show_legend==1
    lgd=legend({'Electrode,','Population'});
    lgd.Orientation='horizontal';
    lgd.Location='southoutside';
end
