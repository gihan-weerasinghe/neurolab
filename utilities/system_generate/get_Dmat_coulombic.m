function [D,TD] = get_Dmat_coulombic(P_rec,P_stim,Ppp)

[nelec_rec,~]=size(P_rec);
[nelec_stim,~]=size(P_stim);
[npop,~]=size(Ppp);

D=zeros(nelec_rec,npop+nelec_stim);

for l=1:nelec_rec
    
    pidx=1;
    
    for j=1:npop
        
        D(l,pidx)=1/norm(P_rec(l,:)-Ppp(j,:));
        pidx=pidx+1;
        
    end
    
    %For stimulation artefact
    
    for j=1:nelec_stim
        
        D(l,pidx)=1/norm(P_rec(l,:)-P_stim(j,:));
        pidx=pidx+1;
        
    end
    
end



TD=zeros(npop,nelec_stim);

for s=1:npop
    
    
    for l=1:nelec_stim
        
        TD(s,l)=1/norm(Ppp(s,:)-P_stim(l,:));
        
    end
    
    
end

end

