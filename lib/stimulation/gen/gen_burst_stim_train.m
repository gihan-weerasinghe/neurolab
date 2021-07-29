function [X,X1,X2] = gen_burst_stim_train(nsamples,fs,fstim,fburst,tburst,toffset,swidth)

X1=gen_stim_train(nsamples,fs,fstim,toffset,1);

Nb=round(tburst*fs);
X2=gen_stim_train(Nb,fs,fburst,0,swidth);


X=conv(X1,X2);
X=X(1:nsamples);

end

