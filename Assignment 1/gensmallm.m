function [Xtrain,Ytrain,Xtest,Ytest] = gensmallm(label0train,label1train,label2train,label3train,label0test,label1test,label2test,label3test,label0, label1, label2, label3, trainsize)
%load('mnist_all.mat') then use this function on two digits
alltraindata = double([label0train;label1train;label2train;label3train]);
alltrainlabels = [ones(size(label0train,1),1)*label0; ones(size(label1train,1),1)*label1;
                  ones(size(label2train,1),1)*label2; ones(size(label3train,1),1)*label3];
[m,d] = size(alltraindata);
perm = randperm(m);
trainind = perm(1:trainsize);
Xtrain = alltraindata(trainind,:);
Ytrain = alltrainlabels(trainind);

alltestdata = double([label0test; label1test; label2test; label3test]);
alltestlabels = [ones(size(label0test,1),1)*label0;ones(size(label1test,1),1)*label1;
                 ones(size(label2test,1),1)*label2; ones(size(label3test,1),1)*label3];
ntest = size(alltestdata,1);
perm = randperm(ntest);
Xtest = alltestdata(perm,:);
Ytest = alltestlabels(perm);