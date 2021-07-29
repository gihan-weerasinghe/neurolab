function [P,Ppp] = generate_random_system(npop,nelec,Lmax,damp)

[P_rec,~,Ppp] = generate_random_system_multi(npop,nelec,nelec,Lmax,damp);

P=P_rec;


end

