%Q2a:
load('mnist_all.mat');
disp('testing Q2a.')
k = 1;
d = 784;
errs = [];
for m = 10:10:500
    sampleSizeStr = ['training sample size: ' , int2str(m)];
    disp(sampleSizeStr)
    [Xtrain,Ytrain,Xtest,Ytest] = gensmallm(train3, train4, train5, train6, test3, test4, test5, test6, 3, 4, 5, 6, m);
    ntest = size(Ytest,1);
    Ytest_predict = nn(k, m, d, ntest, Xtrain, Ytrain, Xtest);
    errs = [errs [m ; mean(Ytest ~= Ytest_predict)]];
end
plot(errs(1,:),errs(2,:),'bo-')
xlabel('sample size')
ylabel('prediction error')
