function [P,Ppp] = generate_random_system_spherical_fl_ratio(npop,nelec,iratio)

ratio_to_damp=@(A,x)A(1)*(exp(A(2)*x)-1);
A=[0.0211,6.1753];

damp=ratio_to_damp(A,iratio);

tol=0.001;

diff_ratio=5;

while diff_ratio>tol
    
    rdamp=abs(normrnd(damp,0.1,[1,1]));
    [P,Ppp]=generate_random_system_spherical_fl_constrained(npop,nelec,1,rdamp);
    ratio=calc_dnp_adap_ratio(P,Ppp);
    diff_ratio=abs(ratio-iratio);
    
end


end

