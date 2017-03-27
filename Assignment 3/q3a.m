load('mnist_all.mat');

m = 50;
d = 784;
k=1;
[Xtrain,Ytrain,Xtest,Ytest] = gensmallm(train3, train5, test3, test5, m); 

errs = [];

for n = -10:8
    lambda = 10 ^ n;
    alpha = softsvmpoly(lambda,k, m, d, Xtrain, Ytrain);
    Ytest_predict = sign((1+ Xtest*Xtrain').^k * alpha);
    errs = [errs [n ; mean(Ytest ~= Ytest_predict)]];
end

plot(errs(1,:),errs(2,:),'ro-')
xlabel('log(lambda)')
ylabel('prediction error')

HeatMap(reshape(alpha, [10,10]));