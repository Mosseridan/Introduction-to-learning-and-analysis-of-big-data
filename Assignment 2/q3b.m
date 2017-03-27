load('mnist_all.mat');

m1 = 50;
m2 = 1000;
d = 784;

[Xtrain1,Ytrain1,Xtest,Ytest] = gensmallm(train3, train5, test3, test5, m1); 
[Xtrain2,Ytrain2,Xtest,Ytest] = gensmallm(train3, train5, test3, test5, m2); 

errs = [];
w_results = zeros(19, d);

for n = -10:8
    lambda = 10 ^ n;
    
    w1 = softsvm(lambda, m1, d, Xtrain1, Ytrain1);
    Ytest_predict1 = sign(Xtest * w1);
    
    w2 = softsvm(lambda, m2, d, Xtrain2, Ytrain2);
    w_results(n + 11, :) = w2;
    Ytest_predict2 = sign(Xtest * w2);
    
    errs = [errs [n ; mean(Ytest ~= Ytest_predict1); mean(Ytest ~= Ytest_predict2)]];
end

plot(errs(1,:),errs(2,:),'ro-');
hold on;
plot(errs(1,:),errs(3,:),'bo-');
xlabel('log(lambda)');
ylabel('prediction error');
legend('m = 50', 'm = 1000');
%hold off;

[~, i] = min(errs(3,:))
HeatMap(reshape(w_results(i, :), [28,28]));