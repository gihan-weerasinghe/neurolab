function Q = cr_stim(sobj)
%Time-shifted Coordinated Reset

%Tass, P. A. (2003). A model of desynchronizing deep brain stimulation with 
%a demand-controlled coordinated reset of neural subpopulations. 
%Biological cybernetics, 89(2), 81-88.


%Note that fburst and fstim are interchanged here from the definitions in
%the paper. fburst is the frequency of the burst, i.e. 130 Hz. fstim is the
%frequency of each burst, i.e. tremor frequency.

if sobj.model.n==sobj.nstart
    
    sobj.stim_par.stim_train=gen_cr_tdelay_stim(sobj.nelec_stim,sobj.model.nsamples,sobj.model.fs,sobj.stim_par.fstim,sobj.stim_par.fburst,sobj.stim_par.tburst,sobj.Qmax);
    
end

Q=sobj.stim_par.stim_train(:,sobj.model.n)';

if sobj.model.rho( sobj.model.n )<sobj.stim_par.rho_thresh
    
    Q=Q*0;
    
end

end

