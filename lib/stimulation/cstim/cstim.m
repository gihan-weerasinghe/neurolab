function Q = cstim(sobj)

%Constant frequency stimulation

Qvec=zeros(1,sobj.nelec_stim);
Qvec(sobj.stim_par.elec_idx)=1;

Q=zeros(1,sobj.nelec_stim)+sobj.Qmax;
Q=Q.*Qvec;

end

