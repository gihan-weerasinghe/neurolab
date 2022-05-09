ntheta=100;

zA=[4,0];
zB=[0,-1];
zline=zeros(1,ntheta);
th_vec=linspace(0,2*pi,ntheta);
Z=prf(th_vec,zA,zB);

plot(th_vec,Z);
hold on
plot(th_vec,zline,'--');
hold off

xticks([0,pi/2,pi,3*pi/2,2*pi])
xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
xlim([0,2*pi]);
xlabel('$\theta$ (rad)','interpreter','latex')
ylabel('$Z(\theta)$','interpreter','latex')
