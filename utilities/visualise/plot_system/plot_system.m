function plot_system(P,Ppp)
GCF_POS=[443   190   923   796];
scatter3(P(:,1),P(:,2),P(:,3),1000,'green','x','LineWidth',5.5);
hold on
scatter3(Ppp(:,1),Ppp(:,2),Ppp(:,3),500,'red','o','LineWidth',2.5);
hold off
%legend('Electrode','Population')
set(gcf, 'Position', GCF_POS);
end

