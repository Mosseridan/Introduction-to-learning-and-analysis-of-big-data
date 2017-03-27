function [X,Y] = gensmallm(trainsize)
  load('mnist_all.mat')  
  alltraindata = double([train0;train1;train2;train3;train4;train5;train6;train7;train8;train9]);
  alltrainlabels = [zeros(size(train0,1),1); ones(size(train1,1),1);
                    ones(size(train2,1),1)*2; ones(size(train3,1),1)*3;
                    ones(size(train4,1),1)*4; ones(size(train5,1),1)*5;
                    ones(size(train6,1),1)*6; ones(size(train7,1),1)*7;
                    ones(size(train8,1),1)*8; ones(size(train9,1),1)*9];
  m = size(alltraindata, 1);
  perm = randperm(m);
  trainind = perm(1:trainsize);
  X = alltraindata(trainind,:);
  Y = alltrainlabels(trainind);
end
%load('mnist_all.mat') then use this function on two digits
%alltraindata = double([label0train;label1train;label2train;label3train]);
%alltrainlabels = [ones(size(label0train,1),1)*label0; ones(size(label1train,1),1)*label1;
%                  ones(size(label2train,1),1)*label2; ones(size(label3train,1),1)*label3];
%[m,d] = size(alltraindata);
%perm = randperm(m);
%trainind = perm(1:trainsize);
%Xtrain = alltraindata(trainind,:);
%Ytrain = alltrainlabels(trainind);

%alltestdata = double([label0test; label1test; label2test; label3test]);
%alltestlabels = [ones(size(label0test,1),1)*label0;ones(size(label1test,1),1)*label1;
%                 ones(size(label2test,1),1)*label2; ones(size(label3test,1),1)*label3];
%ntest = size(alltestdata,1);
%perm = randperm(ntest);
%Xtest = alltestdata(perm,:);
%Ytest = alltestlabels(perm);