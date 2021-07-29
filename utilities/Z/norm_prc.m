function [a1,b1] = norm_prc(ia1,ib1)

%Normalise PRC (excluding shift) to 1.
mag_prc=((ia1^2)+(ib1^2))^0.5;
a1=ia1/mag_prc;
b1=ib1/mag_prc;


end

