ngrid=100;

a0=@(c0,phi)c0*cos(phi);
a1=@(c1,phi)c1*cos(phi);
b1=@(c1,phi)-1*c1*sin(phi);

phi_vec=linspace(0,2*pi,ngrid);
c0_vec=linspace(-0.1,0.1,ngrid);
c1_vec=linspace(0.01,0.09,ngrid);

a0_vec=zeros(1,ngrid*ngrid);
a1_vec=zeros(1,ngrid*ngrid);
b1_vec=zeros(1,ngrid*ngrid);
l=1;

for j=1:ngrid
   
    for k=1:ngrid
       
        phi=phi_vec(j);
        c0=c0_vec(k);
        c1=c1_vec(k);
        
        a0_vec(l)=a0(c0,phi);
        a1_vec(l)=a1(c1,phi);
        b1_vec(l)=b1(c1,phi);
        l=l+1;
    end
    
end
a0mm=[min(a0_vec),max(a0_vec)];
a1mm=[min(a1_vec),max(a1_vec)];
b1mm=[min(b1_vec),max(b1_vec)];

disp(['a0: ',num2str(a0mm)]);
disp(['a1: ',num2str(a1mm)]);
disp(['b1: ',num2str(b1mm)]);
