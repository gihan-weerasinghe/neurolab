function plot_config_sp(iang,irho,imax_rho,iqlinewidth,iqlinecolor)

%Plot an single population oscillator configuration

ntheta=length(iang);

if exist('irho','var')==0
    
    rho=zeros(1,ntheta)+1;
    
else
    
    rho=irho;
    
end

if exist('imax_rho','var')==0
    
    max_rho=max(rho);
    
else
    
    max_rho=imax_rho;
    
end

if exist('iqlinewidth','var')==0
    
    qlinewidth=1.5;
    
else
    
    qlinewidth=iqlinewidth;
    
end


GCF_POS=[392   142   693   596];

shift=0.1;
thval=linspace(0,2*pi,1000);
xval=max_rho*cos(thval);
yval=max_rho*sin(thval);
plot(xval,yval,'black','LineWidth',2.5);
xlim([-max_rho-shift,max_rho+shift]);
ylim([-max_rho-shift,max_rho+shift]);
hold on

[U,V]=ang_to_cart(iang);
U=U.*rho;
V=V.*rho;

x=zeros(1,length(iang));
y=zeros(1,length(iang));

if exist('iqlinecolor','var')==1
    quiver(x,y,U,V,'AutoScaleFactor',1,'LineWidth',qlinewidth,'color',iqlinecolor);
else
    quiver(x,y,U,V,'AutoScaleFactor',1,'LineWidth',qlinewidth);
end

hold off
set(gcf, 'Position', GCF_POS);

end