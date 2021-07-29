function Q = pl_stim(sobj)

%Routine for delivering stimulation locked to the global phase of
%oscillations. Q is the vector of charges across the contacts. In this case,
%where stimulation is delivered, Q=Qmax across all contacts. stim_phase is
%the phase of stimulation, psi is the ongoing phase and psi_tol is the
%tolerance for comparing phases.

Q=zeros(1,sobj.nelec_stim);

if abs(sobj.stim_par.stim_phase-sobj.model.psi(sobj.model.n))<=sobj.stim_par.psi_tol
    
    Q=Q+sobj.Qmax;
    
end

end

