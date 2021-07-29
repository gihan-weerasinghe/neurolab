function X = gen_stim_train(nsamples,fs,fstim,toffset,swidth)

dt=1/fs;
X=zeros(1,nsamples);
dX=round(fs/fstim);
soffset=round(toffset/dt)+1;
X(soffset:dX:nsamples)=1;
p=zeros(1,swidth)+1;
X=conv(X,p);
X=X(1:nsamples);

end

