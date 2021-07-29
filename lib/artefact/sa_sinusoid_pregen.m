function stim_l = sa_sinusoid_pregen(sobj)

if sobj.model.n==sobj.nstart
    
    nelec=sobj.nelec;
    nsamples=sobj.model.nsamples;
    fs=sobj.model.fs;
    
    artefact_twidth=sobj.stim_par.artefact_twidth;
    tvec=(0:1/fs:artefact_twidth);
    af=@(t)sin(2*pi*(1/artefact_twidth)*t);
    X1=af(tvec);
    
    X2=sobj.stim_par.stim_train;
    sobj.stim_par.stim_train_artefact=zeros(nelec,nsamples);
    
    for j=1:nelec
       
        sobj.stim_par.stim_train_artefact(j,:)=conv(X1,X2(j,:));
        
    end
    
    
end

stim_l=sobj.stim_par.stim_train_artefact(:,sobj.model.n)';


end

