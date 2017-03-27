%Q1 tests:
disp('testing Q2a.')
k=1;
m=3;
d=2;
ntest=4;
Xtrain=[1,2;3,4;5,6];
Ytrain=[1;0;1];
Xtest=[10,11;3.1,4.2;2.9,4.2;5,6];
Ytest = nn(k,m,d,ntest,Xtrain,Ytrain,Xtest);
Ytest



%Q2b tests:

disp('testing Q2b.')


