function kmat = get_kmat(diag_val,off_diag_val,npop)

off_diag_vec=zeros(1,npop)+off_diag_val;
diag_vec=zeros(1,npop)+diag_val;

diag_mat=diag(diag_vec);
tmp_diag=diag(off_diag_vec);

kmat=zeros(npop,npop)+off_diag_val;
kmat=kmat-tmp_diag+diag_mat;


end

