function C = spectral(W, k, t)
    m = size(W,1);
    D = diag(W * ones(m,1));
    L = D-W;
    [U,A] = eig(L);
    [~,eigen_indices] = sort(diag(A), 'descend');
    
    Ut = U(:,eigen_indices(m-k+1:m));
    C = kmeans(Ut, k, t);
end