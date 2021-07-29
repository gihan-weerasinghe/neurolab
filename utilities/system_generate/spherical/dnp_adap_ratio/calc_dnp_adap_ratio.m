function y = calc_dnp_adap_ratio(P,Ppp)

[nelec,~]=size(P);
[npop,~]=size(Ppp);

ad=zeros(1,nelec);
x=zeros(1,npop);

for l=1:nelec
   
    
    for s=1:npop
        
        x(s)=norm(P(l,:)-Ppp(s,:));
        
    end
    
    ad(l)=min(x)/mean(x);
    
end

y=mean(ad);


end

