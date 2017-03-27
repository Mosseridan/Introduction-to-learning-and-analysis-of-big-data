load('mnist_all.mat');

m1 = 50;
m2 = 1000;
d = 784;
k=1
[Xtrain1,Ytrain1,Xtest,Ytest] = gensmallm(train3, train5, test3, test5, m1); 
[Xtrain2,Ytrain2,Xtest,Ytest] = gensmallm(train3, train5, test3, test5, m2); 

errs = [];
w_results = zeros(19, d);

for n = -10:8
    lambda = 10 ^ n;
    
    alpha1 = softsvmpoly(lambda,k, m1, d, Xtrain1, Ytrain1);
    Ytest_predict1 = sign((1+ Xtest*Xtrain1').^k * alpha1);
    
    
    alpha2 = softsvmpoly(lambda,k, m2, d, Xtrain2, Ytrain2);
    Ytest_predict2 = sign((1+ Xtest*Xtrain2').^k * alpha2);
    
    w_results(n + 11, :) = alpha2;

    
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