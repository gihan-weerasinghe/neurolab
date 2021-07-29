function [P_rec,P_stim,Ppp] = generate_random_system_multi(npop,nelec_rec,nelec_stim,Lmax,damp,idamp_width)

if exist('idamp_width','var')==1
   
    damp_width=idamp_width;
    
else
    
    damp_width=0;
    
end


Ppp=random_real([0,Lmax],[npop,3]);
P_stim=zeros(nelec_stim,3);
P_rec=zeros(nelec_rec,3);
pidx=1;

damp_vec=normrnd(damp,damp_width,[1,nelec_rec]);

for j=1:nelec_rec
    
    if pidx>npop
        
        pidx=1;
        
    end
    
    P_rec(j,:)=random_real([-1,1],[1,3]);
    P_rec(j,:)=Ppp(pidx,:)+((P_rec(j,:)/norm(P_rec(j,:)))*damp_vec(j));
    pidx=pidx+1;
    
end

pidx=1;

damp_vec=normrnd(damp,damp_width,[1,nelec_stim]);

for j=1:nelec_stim
    
    
    if pidx>npop
        
        pidx=1;
        
    end
    
    P_stim(j,:)=random_real([-1,1],[1,3]);
    P_stim(j,:)=Ppp(pidx,:)+((P_stim(j,:)/norm(P_stim(j,:)))*damp_vec(j));
    pidx=pidx+1;
    
end


end

