load('EX3q1_data.mat')

alpha = softsvmpoly(1, 3, size(Xtrain,1), size(Xtrain,2), Xtrain, Ytrain); 
Ytest_predict = sign((1+ Xtest*Xtrain').^3 * alpha);
ei = mean(Ytest ~= Ytest_predict)

w = get_w(alpha,Xtrain)