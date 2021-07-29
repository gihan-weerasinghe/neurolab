function D = get_Dmat_full(P,P2)

[nP,~]=size(P);
[nP2,~]=size(P2);

D=zeros(nP2,nP);

for j=1:nP2
   
    for l=1:nP
       
        D(j,l)=1/norm(P2(j,:)-P(l,:));
        
    end
    
end

end

