load('mnist_all.mat')
m = 1000;

[X,Y] = gensmallm(m);
k = 10;
iters = 5000;
percentages = zeros(iters, k);
modes = zeros(iters, k);
errs = zeros(iters, 1);
Cs = zeros(m,iters);
Ypreds = zeros(m,iters);

for j = 1:iters

    
    C = kmeans(X, k, 10000);
    Cs(:,j) = C;
    Ypredict = zeros(size(C));
    
    for i = 1:k
        labels = Y(C==i);
        modes(j,i) = mode(labels);
        percentages(j,i) = sum(labels==modes(j,i)) / size(labels,1) * 100.0;
        Ypredict = Ypredict + (C==i)*modes(j,i);
    end
    Ypreds(:,j) = Ypredict;
    errs(j) = mean(Y ~= Ypredict);
end

best_err = min(errs);
best_run = find(errs == best_err);
best_C = Cs(:,best_run);
best_modes = modes(best_run,:);
best_percentages = percentages(best_run,:);

N = zeros(10,1);
for i = 1:10
    N(i) = sum(Y==(i-1));
end