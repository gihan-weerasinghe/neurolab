function Q = oa_pl(sobj)

%Phase-locked stimulation

R=zeros(1,sobj.model.npop);
n=sobj.model.n;
psi=sobj.model.psi(n);

for j=1:sobj.model.npop
    
    
    R(j)=calc_mp_pl_ar_single(sobj.stim_par.zA(j,:),sobj.stim_par.zB(j,:),psi);
    
    
end

X=0.5*((sobj.TD)')*(R');

Q=zeros(1,sobj.nelec_stim)+sobj.Qmax;
Q(find(X>=0))=0;

end

