function [Xtrain,Ytrain,Xtest,Ytest] = gensmallm(label0train,label1train,label0test,label1test,trainsize)
%load('mnist_all.mat') then use this function on two digits
alltraindata = double([label0train;label1train]);
alltrainlabels = [-ones(size(label0train,1),1);ones(size(label1train,1),1)];
[m,d] = size(alltraindata);
perm = randperm(m);
trainind = perm(1:trainsize);
Xtrain = alltraindata(trainind,:);
Ytrain = alltrainlabels(trainind);

alltestdata = double([label0test; label1test]);
alltestlabels = [-ones(size(label0test,1),1);ones(size(label1test,1),1)];
ntest = size(alltestdata,1);
perm = randperm(ntest);
Xtest = alltestdata(perm,:);
Ytest = alltestlabels(perm);