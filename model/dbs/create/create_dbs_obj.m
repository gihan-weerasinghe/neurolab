function dobj = create_dbs_obj(imodel)

fname=fieldnames(imodel);
nerrors=0;

for j=1:length(fname)
    
    if isempty( getfield(imodel, fname{j} ) ) ==1
        
        warning([fname{j},' is undefined.']);
        nerrors=nerrors+1;
        
    end
    
    
end

if nerrors>0
    
    error('Undefined fields.')
    
end



dobj=dbs(imodel.nelec_rec,imodel.nelec_stim,imodel.fm,imodel.Qmax,imodel.model,imodel.sfunc);
fs=imodel.model.fs;

dobj.nstart=round(imodel.tstart*fs)+1;
dobj.fm=imodel.fm;
dobj.Qmax=imodel.Qmax;
dobj.nelec_rec=imodel.nelec_rec;
dobj.nelec_stim=imodel.nelec_stim;
dobj.model=imodel.model;
dobj.D=imodel.D;
dobj.TD=imodel.TD;
dobj.sfunc=imodel.sfunc;
dobj.sa_func=imodel.sa_func;

dobj.stim_par.sim_count=0;
dobj.stim_par.sa_amp=imodel.sa_amp;


if strcmp(imodel.stim_strategy,'cr_stim')==1
    
    dobj.stim_par.fstim=imodel.fstim;
    dobj.stim_par.fburst=imodel.fburst;
    dobj.stim_par.tburst=imodel.tburst;
    dobj.stim_par.rho_thresh=imodel.rho_thresh;
    
end

if strcmp(imodel.stim_strategy,'acd_est_psi')==1
    
    dobj.stim_par.wvec_est=imodel.wvec_est;
    dobj.stim_par.zA=imodel.zA;
    dobj.stim_par.zB=imodel.zB;
    
    
end

if strcmp(imodel.stim_strategy,'acd')==1
    
    dobj.stim_par.zA=zeros(dobj.model.npop,2);
    dobj.stim_par.zB=zeros(dobj.model.npop,2);
    
    for j=1:dobj.model.npop
        
        dobj.stim_par.zA(j,:)=dobj.model.zA(j,:)*dobj.model.wvec(j);
        dobj.stim_par.zB(j,:)=dobj.model.zB(j,:)*dobj.model.wvec(j);
        
    end
    
    
end

if strcmp(imodel.stim_strategy,'oa_pl')==1
    
    dobj.stim_par.zA=zeros(dobj.model.npop,2);
    dobj.stim_par.zB=zeros(dobj.model.npop,2);
    
    for j=1:dobj.model.npop
        
        dobj.stim_par.zA(j,:)=dobj.model.zA(j,:)*dobj.model.wvec(j);
        dobj.stim_par.zB(j,:)=dobj.model.zB(j,:)*dobj.model.wvec(j);
        
    end
    
    
end

end

