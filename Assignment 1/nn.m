
function Ytest_predict = nn(k, m, d, ntest, Xtrain, Ytrain, Xtest)
    Ytest_predict = zeros(ntest,1);
    for i = 1:ntest
       dists = sqrt(sum(bsxfun(@minus,Xtrain,Xtest(i,:)).^2, 2));
       dists_tags = sortrows([dists Ytrain]);
       Ytest_predict(i,1) = mode(dists_tags(1:k,2));
    end
    
end
