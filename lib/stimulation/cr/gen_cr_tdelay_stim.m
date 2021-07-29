function y = gen_cr_tdelay_stim(nelec,nsamples,fs,fstim,fburst,tburst,I)

y=zeros(nelec,nsamples);

tshift=@(k)(k-1)/(nelec*fstim);

for j=1:nelec
   
    y(j,:)=gen_burst_stim_train(nsamples,fs,fstim,fburst,tburst,tshift(j),1)*I;
    
end


end

