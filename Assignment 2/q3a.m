load('mnist_all.mat');

m = 50;
d = 784;
[Xtrain,Ytrain,Xtest,Ytest] = gensmallm(train3, train9, test3, test9, m); 

errs = [];

for n = -10:8
    lambda = 10 ^ n;
    w = softsvm(lambda, m, d, Xtrain, Ytrain);
    Ytest_predict = sign(Xtest * w);
    errs = [errs [n ; mean(Ytest ~= Ytest_predict)]];
    %HeatMap(reshape(w, [28,28]));
end

plot(errs(1,:),errs(2,:),'ro-')
xlabel('log(lambda)')
ylabel('prediction error')

HeatMap(reshape(w, [28,28]));