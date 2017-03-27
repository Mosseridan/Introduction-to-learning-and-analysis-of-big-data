load('EX4q2_data.mat');
m = size(X,1);
k = 2;
t = 100;

W = zeros(m,m);

for i = 1:m
    for j = 1:m
        W(i,j) = exp(-norm(X(i,:) - X(j,:)) ^ 2);
    end
end
        
C = spectral(W, k, t);
plot(X(C==1,1), X(C==1,2), '.r', X(C==2,1), X(C==2,2), '.b');