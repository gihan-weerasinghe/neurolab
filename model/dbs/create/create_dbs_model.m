function model = create_dbs_model(istim_strategy)

model=[];

%Time to start stimulation
model.tstart=[];
%Maximum frequency of stimulation
model.fm=[];
%Maximum charge on plate
model.Qmax=[];
%Number of recording electrodes
model.nelec_rec=[];
%Number of stimulating electrodes
model.nelec_stim=[];
%Model data
model.model=[];
%Matrix to obtain effect of all populations at an electrode.
model.D=[];
%Matrix to obtain effect of all electrodes at a population.
model.TD=[];
%Stimulation strategy function (string).
model.stim_strategy=istim_strategy;
%Stimulation strategy function.
model.sfunc=str2func(istim_strategy);
%Stimulation artefact function.
model.sa_func=[];
%Stimulation artefact amplitude.
model.sa_amp=[];

if strcmp(istim_strategy,'cr_stim')==1
    
    model.fstim=[];
    model.fburst=[];
    model.tburst=[];
    model.rho_thresh=[];
    
end

if strcmp(istim_strategy,'acd_est_psi')==1
    
    model.wvec_est=[];
    model.zA=[];
    model.zB=[];
    
end


end

