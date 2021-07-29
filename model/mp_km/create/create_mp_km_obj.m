function obj = create_mp_km_obj(imodel)

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

nsamples=round(imodel.T*imodel.fs);
obj=mp_km(nsamples,imodel.npop,imodel.nperpop,imodel.fs);

obj.set_prc(imodel.zA,imodel.zB);
obj.kmat=imodel.kmat;
obj.sigma=zeros(1,imodel.npop)+imodel.sigma;

obj.nat_freq_dist=imodel.nat_freq_dist;
obj.w0=imodel.w0;
obj.gamma=imodel.gamma;

obj.gen_nat_freq;

end

