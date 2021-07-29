function y = calc_kmat_coupling(kvec,rho_vec,psi_vec,wvec,pop_theta_vec)

npop=length(wvec);
nperpop=length(pop_theta_vec);

y=zeros(1,nperpop);

for s=1:npop
   
    
    y=y+wvec(s)*kvec(s)*rho_vec(s)*sin(psi_vec(s)-pop_theta_vec);
    
    
end


end

