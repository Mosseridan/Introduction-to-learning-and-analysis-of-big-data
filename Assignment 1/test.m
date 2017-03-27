load('mnist_all.mat');
disp('testing Q2a.')
k = 1;
d = 784;
errs = [];
    sampleSizeStr = ['training sample size: ' , int2str(m)];
    disp(sampleSizeStr)
    [Xtrain,Ytrain,Xtest,Ytest] = gensmallm(train3, train4, test3, test4, m);
    Ytest = Ytest + 3;
    [Xtrain,Ytrain,Xtest,Ytest] = gensmallm(Xtrain, train5, Xtest, test5, m);
    %[Xtrain,Ytrain,Xtest,Ytest] = gensmallm(Xtrain, train6, Xtest, test6, m);