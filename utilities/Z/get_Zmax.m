function y = get_Zmax(A,B)

sn_max=((A(2)^2)+(B(2)^2))^0.5;

y=max([abs( A(1)+sn_max ),abs( A(1)-sn_max) ]);


end

