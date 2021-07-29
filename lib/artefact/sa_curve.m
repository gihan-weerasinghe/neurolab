function stim_l = sa_curve(sobj)

n=sobj.model.n;
stim_l=zeros(sobj.nelec_stim,1);

for j=1:sobj.nelec_stim
   
    sobj.stim_par.sa_trg_buffer(j,:)=circshift(sobj.stim_par.sa_trg_buffer(j,:),-1);
    sobj.stim_par.sa_trg_buffer(j,end)=sobj.trg_l(j,n);
    
end

for j=1:sobj.nelec_stim
   
    X=conv(sobj.stim_par.art_curve,sobj.stim_par.sa_trg_buffer(j,:));
    X=X(1:sobj.stim_par.sa_window_size);
    stim_l(j,1)=X(end);
    
    
end

end

