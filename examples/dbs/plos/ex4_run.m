%Example 4
%System geometry: spherical
%Frequency distribution: Lorentzian
%Stimulation strategy: Phase-locked

%% Set model parameters

%Set number of populations
npop=3;
%Set number of oscillators per population
nperpop=600;

%Parameters for natural frequency lorentzian distribution.
%[width,centre]
lorentz_param=[0.9615   24.6316];
lorentzian_centre=lorentz_param(2);

%Simulation time
T=40;
%Sampling rate
fs=400;
%Noise determined as a multiple of the centre frequency
sigma_mult=0.05;
%Off diagonal components of the coupling matrix.
k_off_diag=0;
%Diagonal components of the coupling matrix.
k_on_diag=55;

%Number of samples in simulation.
nsamples=T*fs;
%Time domain vector.
tvec=linspace(0,T,T*fs);

%Generate instantaneous phase response curve
%zA cosine Fourier coefficients [a0,a1]
%zB sine Fourier coefficients [b0,b1]
zA=[4,0];
zB=[0,-1];

%Integration step
dt=1/fs;

%Create multi-population Kuramoto configurator structure
mp_km_model=create_mp_km_model();

%Configure the model
mp_km_model.T=T;
mp_km_model.fs=fs;
mp_km_model.npop=npop;
mp_km_model.nperpop=nperpop;
mp_km_model.sigma=(lorentzian_centre)*sigma_mult;
mp_km_model.kmat=get_kmat(k_on_diag,k_off_diag,mp_km_model.npop);
mp_km_model.gamma=lorentz_param(1);
mp_km_model.w0=lorentz_param(2);
mp_km_model.nat_freq_dist='cauchy';
mp_km_model.zA=zA;
mp_km_model.zB=zB;

%Create instance of the multi-population Kuramoto object
mpk=create_mp_km_obj(mp_km_model);

%% Set DBS parameters

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
dbs_model=create_dbs_model('oa_pl');
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

%% Run simulation

d1.simulate();

%% Plot output

figure
%Plot symptom signal together with average stimulation
%triggers across stimulating electrode.
d1.plot_osc_trg;

figure
%Plot triggers across stimulating electrodes.
d1.plot_trg_l;

figure
%Plot electrode channel activity.
d1.plot_channels;


%% Show system

figure
plot_system_spherical;