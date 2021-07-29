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