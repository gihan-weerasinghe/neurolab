function qmax = get_qmax(dtheta_max,Z_max,dt,TD)

[npop,~]=size(TD);
dsum_vec=zeros(1,npop);

for s=1:npop
   
    dsum_vec(s)=sum(TD(s,:));
  
end


qmax=dtheta_max/(Z_max*dt*max(dsum_vec));

end

