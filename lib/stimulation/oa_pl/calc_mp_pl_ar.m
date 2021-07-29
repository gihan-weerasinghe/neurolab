function y = calc_mp_pl_ar(I_s_vec,A_s_mat,B_s_mat,psi)

npop=length(I_s_vec);
y=0;

for j=1:npop
    
    y=y+I_s_vec(j)*calc_mp_pl_ar_single(A_s_mat(j,:),B_s_mat(j,:),psi);
    
end

y=y*(1/(2*npop));

end

