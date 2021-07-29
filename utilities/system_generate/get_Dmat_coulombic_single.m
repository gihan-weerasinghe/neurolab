function [D,TD] = get_Dmat_coulombic_single(P,Ppp)

[nelec,~]=size(P);
[npop,~]=size(Ppp);

D=zeros(nelec,npop);

for l=1:nelec
    
    pidx=1;
    
    for j=1:npop
        
        D(l,pidx)=1/norm(P(l,:)-Ppp(j,:));
        pidx=pidx+1;
        
    end
    
    
end


for j=nelec+1:npop+nelec
   
    D(:,j)=0;
    
end

TD=zeros(npop,nelec);

for l=1:nelec
   
    for s=1:npop
        
        TD(s,l)=D(l,s);
    
    end
    
end

end

