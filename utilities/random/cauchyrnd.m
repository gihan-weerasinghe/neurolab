function y = cauchyrnd(imu,igamma,x)

Cauchy=@(gamma,mu)makedist('Stable','alpha',1,'beta',0,'gam',gamma,'delta',mu);
y=random(Cauchy(igamma,imu),x);

end

