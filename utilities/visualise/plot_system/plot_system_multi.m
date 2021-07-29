function plot_system_multi(P_rec,P_stim,Ppp)

GCF_POS=[443   190   923   796];
scatter3(P_rec(:,1),P_rec(:,2),P_rec(:,3),600,'green','x','LineWidth',2);
hold on
scatter3(P_stim(:,1),P_stim(:,2),P_stim(:,3),600,'red','x','LineWidth',2);
scatter3(Ppp(:,1),Ppp(:,2),Ppp(:,3),500,'o','LineWidth',2,'MarkerEdgeColor',[0.9290, 0.6940, 0.1250]);
hold off
legend('Recording electrode','Stimulating electrode','Population')
make_presentation_plot
set(gcf, 'Position', GCF_POS);


end

