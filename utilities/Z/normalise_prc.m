function [zA,zB] = normalise_prc(izA,izB,iZmax)

Zmax=get_Zmax(izA,izB);
zA=(iZmax/Zmax)*izA;
zB=(iZmax/Zmax)*izB;

end

