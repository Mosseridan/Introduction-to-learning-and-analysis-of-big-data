
disp('testing Q2f.')

m = 500;
errs = [];
k = 1;

[Xtrain,Ytrain,Xtest,Ytest] = gensmallm(train3, train4, train5, train6, test3, test4, test5, test6, 3, 4, 5, 6, m);
ntest = size(Ytest,1);
Ytest_predict = nn(k, m, d, ntest, Xtrain, Ytrain, Xtest);

confmat = confusionmat(Ytest,Ytest_predict)
sumrows = confmat * ones(size(confmat,2),1)
for i = 1:size(confmat, 2)
    confmat(i,:) = (confmat(i, :) / sumrows(i)) * 100;
end
