function [P,Ppp] = generate_random_system_spherical_fl_constrained(npop,nelec,R,idamp)

damp=min([idamp,2*R]);

P=zeros(nelec,3);
Ppp=zeros(npop,3);

a=(2*R/(nelec-1));

theta0=pi/4;
phi0=pi/4;

v0=[R*sin(theta0)*cos(phi0),R*sin(theta0)*sin(phi0),R*cos(theta0)];
v0_hat=v0/norm(v0);
v=@(m)v0-m*a*v0_hat;

for l=1:nelec
   
    P(l,:)=v(l-1);
    
end

pidx=1;

for s=1:npop
    
    if pidx>nelec
        
        pidx=1;
        
    end
    
    bflag=0;
    
    while bflag==0
        
        rR=random_real([0,R],[1,1]);
        rtheta=random_real([0,2*pi],[1,1]);
        rphi=random_real([0,2*pi],[1,1]);
        
        vr=[rR*sin(rtheta)*cos(rphi),rR*sin(rtheta)*sin(rphi),rR*cos(rtheta)];
        vr_hat=vr/norm(vr);
        
        rdamp=random_real([0.1,damp],[1,1]);
        Ppp(s,:)=P(pidx,:)+vr_hat*rdamp;
        
        if norm(Ppp(s,:))<=R
            bflag=1;
        end
        
    end
    
    
    pidx=pidx+1;
    
end


end

