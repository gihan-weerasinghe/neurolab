function Q = rstim(sobj)

%Random stimulation

if isfield(sobj.stim_par,'freqs')==1
    
    tstim_elec=0.2;
    nstim_elec=round(tstim_elec*sobj.model.fs);
    xm=mod(sobj.model.n,nstim_elec);
    
    if xm==0
        
        sobj.fm=randsample(sobj.stim_par.freqs,1);
        
    end
    
end

Q=random_real([0,sobj.Qmax],[1,sobj.nelec_stim]);

end

