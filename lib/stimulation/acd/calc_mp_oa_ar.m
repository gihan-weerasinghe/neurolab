function y = calc_mp_oa_ar(I_s_vec,A_s_mat,B_s_mat,rho_s_vec,psi_s_vec,psi)

npop=length(I_s_vec);
y=0;

for j=1:npop
    
    y=y+I_s_vec(j)*calc_mp_oa_ar_single(A_s_mat(j,:),B_s_mat(j,:),rho_s_vec(j),psi_s_vec(j),psi);
    
end

y=y*(1/(2*npop));

end

