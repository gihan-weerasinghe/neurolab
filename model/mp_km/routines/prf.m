function Z = prf(itheta,A,B)

Z=A(1)/2;

for n=2:length(A)
    Z=Z+A(n)*cos((n-1)*itheta)+B(n)*sin((n-1)*itheta);
end



end

