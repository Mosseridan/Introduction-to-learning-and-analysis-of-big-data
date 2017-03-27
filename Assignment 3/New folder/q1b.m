load('EX3q1_data.mat')

folds = 10;
e = zeros(folds,3,3);
ks = [3,6,10];
lambdas = [0.01,0.1,1];
m = size(Xtrain,1)*9/10;
d = size(Xtrain,2);
%Xtrain = reshape(Xtrain,m/10,[])';

for i = 1:3
   for j = 1:3
      for r = 1:folds
           k = ks(i)
           lambda = lambdas(j)
           fold = r
       
           Xtest_tag = Xtrain(fold*100-99 : fold*100 , :);
           Ytest_tag = Ytrain(fold*100-99 : fold*100);
           Xtrain_tag = removerows(Xtrain,fold*100-99 : fold*100);
           Ytrain_tag = removerows(Ytrain,fold*100-99 : fold*100);
    
            %epsilon = 10;
            %G = ((1 + Xtrain_tag*Xtrain_tag').^k);
            %G_tag = G + epsilon*speye(m);
            %H = [(2*lambda*G),sparse(zeros(m));sparse(zeros(m,2*m))];
                     
           alpha = softsvmpoly(lambda, k, m, d, Xtrain_tag, Ytrain_tag); 
           Ytest_predict = sign((1+ Xtest_tag*Xtrain_tag').^k * alpha);
           ei = mean(Ytest_tag ~= Ytest_predict)
           e(r,j,i) = ei;
           
      end
   end
end

errs = [ (ones(1,folds)*e(:,:,1))./folds ; (ones(1,folds)*e(:,:,2))./folds ; (ones(1,folds)*e(:,:,3))./folds ]
Ytest_predict = sign((1+ Xtest*Xtrain').^k * alpha);
alpha = softsvmpoly(1, 3, size(Xtrain,1), d, Xtrain, Ytrain); 

ei = mean(Ytest ~= Ytest_predict)

%scatter3([3 6 10 3 6 10 3 6 10] , [0.01 0.01 0.01 0.1 0.1 0.1 1 1 1] , m-errs)
%ylabel('lambda')
%ylabel('k')
%zlabel('prediction error')

%min_err = min(e(:))
