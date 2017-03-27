function C = kmeans(X, k, t)

m = size(X,1);


u = X(randperm(m,k), :);

for iter = 1:t
    C = zeros(k, m);
    for i = 1:m
        distances = bsxfun(@minus, u, X(i,:));
        distances = sqrt(sum(distances .^ 2, 2));
        [~,index] = min(distances);
        C(index,i) = 1;
    end
    old_u = u;
    u = bsxfun(@rdivide, C * X, C * ones(m,1));
    if abs(u - old_u) == 0
       break; 
    end
 end

C = ([1:k] * C)';


end

