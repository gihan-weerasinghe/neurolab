function plot_system_full(P,Pp)

scatter3(P(:,1),P(:,2),P(:,3),600,'green','x','LineWidth',3);
hold on
scatter3(Pp(:,1),Pp(:,2),Pp(:,3),50,'red','o');
hold off
%legend('Electrode','Neuron')
end

