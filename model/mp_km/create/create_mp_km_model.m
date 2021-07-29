function model = create_mp_km_model()

model=[];

%Size of buffer in seconds
model.T=[];
%Sampling rate
model.fs=[];
%Number of oscillators per population (vector)
model.nperpop=[];
%Number of populations
model.npop=[];

%Phase response function Cosine coefficients
model.zA=[];
%Phase response function Sine coefficients
model.zB=[];
%Coupling Matrix
model.kmat=[];
%Vector of noise coefficients
model.sigma=[];

%Natural frequency distribution: 'normal or 'cauchy'.
model.nat_freq_dist=[];
%Average of natural frequency distribution
model.w0=[];
%Width of natural frequency distribution.
model.gamma=[];



end

