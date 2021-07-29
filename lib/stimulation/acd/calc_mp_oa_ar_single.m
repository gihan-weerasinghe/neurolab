function y = calc_mp_oa_ar_single(A_s_vec,B_s_vec,rho_s,psi_s,psi)

nharmonics=length(A_s_vec);
mvec1=0:1:nharmonics-1;
mvec2=1:1:nharmonics-1;

t1=@(m)rho_s.^(m-1).*( A_s_vec(m+1).*sin( (m-1)*psi_s+psi )- B_s_vec(m+1).*cos( (m-1)*psi_s+psi ) ); 
t2=@(m)rho_s.^(m+1).*( A_s_vec(m+1).*sin( (m+1)*psi_s-psi )- B_s_vec(m+1).*cos( (m+1)*psi_s-psi ) ); 

y=sum(t1(mvec2))-sum(t2(mvec1));

end

