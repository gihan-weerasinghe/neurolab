%Set number of recording/stimulating electrodes
nelec=3;

%Configuration parameter (eta)
eta=0.1;

%Generate random system in a unit sphere.
%Electrodes can stimulate and record
%P: positions of electrodes.
%Ppp: positions of populations.

[P,Ppp]=generate_random_system_spherical_fl_ratio(npop,nelec,eta);

%Obtain transformation matrices. D converts vector of population activities
%into electrode measurements. TD converts vector of charges due to
%stimulation into a 'stimulation intensity' at a population.
[D,TD] = get_Dmat_coulombic_single(P,Ppp);

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
dbs_model.nelec_rec=nelec;
dbs_model.nelec_stim=nelec;
dbs_model.D=D;
dbs_model.TD=TD;

%Set stimulation artefact function, found in model/lib/artefact.
dbs_model.sa_func=@sa_none;
%Set amplitude of artefact effect
dbs_model.sa_amp=0;

%Create configured DBS object
d1=create_dbs_obj(dbs_model);

