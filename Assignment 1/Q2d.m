%Q2d tests:
load('mnist_all.mat');

disp('testing Q2d.')
m = 100;
d = 784;
errs = [];
[Xtrain,Ytrain,Xtest,Ytest] = gensmallm(train3, train4, train5, train6, test3, test4, test5, test6, 3, 4, 5, 6, m);
ytest_results = zeros(9,size(Ytest,1));
for k = 1:2:9
    kStr = ['k size: ' , int2str(k)];
    disp(kStr)
    ntest = size(Ytest,1);
    Ytest_predict = nn(k, m, d, ntest, Xtrain, Ytrain, Xtest);
    errs = [errs [k ; mean(Ytest ~= Ytest_predict)]];
    Ytest_results(k,:) = Ytest_predict;
end
plot(errs(1,:),errs(2,:),'ro-')
xlabel('k size')
ylabel('prediction error')



confmat = confusionmat(Ytest,Ytest_results(1,:)');
sumrows = confmat * ones(size(confmat,2),1);
for i = 1:size(confmat, 2)
    confmat(i,:) = (confmat(i, :) / sumrows(i)) * 100;
end

confmat
