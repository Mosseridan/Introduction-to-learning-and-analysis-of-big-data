load('EX3q1_data.mat')

e = [];%zeros(3);
k = [3,6,10];
lambda = [0.01,0.1,1];
m = size(Xtrain,1)*9/10;
d = size(Xtrain,2);
folds = 10;
%Xtrain = reshape(Xtrain,m/10,[])';

for i = 3:3
   for j = 3:3
      for r = 1:1:folds
           display(k(i))
           display(lambda(j))
           display(r)
       
           Xtest_tag = Xtrain(r*100-99 : r*100 , :);
           Ytest_tag = Ytrain(r*100-99 : r*100);
           Xtrain_tag = removerows(Xtrain,r*100-99 : r*100);
           Ytrain_tag = removerows(Ytrain,r*100-99 : r*100);
           
            %G = ((1 + Xtrain_tag*Xtrain_tag').^k(j));
    
            %H = full([(2*lambda(i)*G),sparse(zeros(m));sparse(zeros(m,2*m))]);
    
            %H_tag = full(H + 1e-4*speye(2*m));
           
           alpha = softsvmpoly(lambda(i), k(j), m, d, Xtrain_tag, Ytrain_tag); 
           Ytest_predict = sign((1+ Xtest_tag*Xtrain_tag').^k(j) * alpha);
           ei = mean(Ytest_tag ~= Ytest_predict);
           e = [e ei];
           %e(i,j) = e(i,j) + ei/folds;
      end
   end
end

scatter3([0.01 0.01 0.01 0.1 0.1 0.1 1 1 1] , [3 6 10 3 6 10 3 6 10] , e)
xlabel('lambda')
ylabel('k')
zlabel('prediction error')

min_err = min(e(:))
