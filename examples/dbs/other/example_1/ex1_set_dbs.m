%Set number of recording electrodes
nelec_rec=4;
%Set number of stimulating electrodes
nelec_stim=4;

%Calculating total number of variables per electrode
nvar=2*(npop+1);
%Calculating total number of variables.
nvar_tot=nvar*nelec_stim;

%Create electrodes and populations in a box.
%Distance between electrode and a population.
damp=3;
%Length of box edge
Lmax=10;
%Damp can be sampled from a normal distribution with mean damp and standard
%deviation damp_width.
damp_width=0;


%Generate random system.
%P_rec: positions of recording electrodes.
%P_stim: positions of recording electrodes.
%Ppp: positions of populations.

[P_rec,P_stim,Ppp] = generate_random_system_multi(npop,nelec_rec,nelec_stim,Lmax,damp,damp_width);
%Obtain transformation matrices. D converts vector of population activities
%into electrode measurements. TD converts vector of charges due to
%stimulation into a 'stimulation intensity' at a population.
[D,TD] = get_Dmat_coulombic(P_rec,P_stim,Ppp);

%Set maximum stimulation current (qmax) such that the maximimum perturbation to a
%particular oscillator in the system in dtheta_max.
dtheta_max=0.0005*2*pi;
%Max of Z
Zmax=1;
qmax=get_qmax(dtheta_max,Zmax,dt,TD);

%Create dbs model configurator structure. Input name of stimulation
%strategy function, found in lib/stimulation.
dbs_model=create_dbs_model('acd');
%Stimulation start time.
dbs_model.tstart=15;
%Maximum stimulation frequency.
dbs_model.fm=130;

%Configure the model
dbs_model.model=mpk;
dbs_model.Qmax=qmax;
dbs_model.nelec_rec=nelec_rec;
dbs_model.nelec_stim=nelec_stim;
dbs_model.D=D;
dbs_model.TD=TD;

%Set stimulation artefact function, found in model/lib/artefact.
dbs_model.sa_func=@sa_none;
%Set amplitude of artefact effect
dbs_model.sa_amp=0;

%Create configured DBS object
d1=create_dbs_obj(dbs_model);

