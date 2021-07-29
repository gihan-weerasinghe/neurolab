function Q = acd(sobj)
%Adaptive Coordinated Desynchronisation (ACD)
%Gihan Weerasinghe 2021

R=zeros(1,sobj.model.npop);
n=sobj.model.n;

rho_s=sobj.model.rho_s(:,n);
psi_s=sobj.model.psi_s(:,n);
psi=sobj.model.psi(n);

for j=1:sobj.model.npop
    
    
    R(j)=calc_mp_oa_ar_single(sobj.stim_par.zA(j,:),sobj.stim_par.zB(j,:),rho_s(j),psi_s(j),psi);
    
    
end

X=0.5*((sobj.TD)')*(R');

Q=zeros(1,sobj.nelec_stim)+sobj.Qmax;
Q(find(X>=0))=0;

%[Q,dpdt_min]=linprog(X,[],[],[],[],lb,ub,sobj.stim_par.opts);


end

