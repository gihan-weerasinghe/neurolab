function kout = gen_kstep(T,sampling_rate,baseval,stepval,pos,width)

%Generate an impulse in the coupling constant.
%Outputs a series of T*sampling_rate k values.
%k goes from baseval to stepval as positions in time {pos} and widths {width} (sec)


nsamples=T*sampling_rate;
kout=zeros(1,nsamples)+baseval;

for j=1:length(pos)
    
    s1=round(pos(j)*sampling_rate);
    s2=round((pos(j)+width(j))*sampling_rate);
    kout(s1:s2)=stepval;
    
end



end

