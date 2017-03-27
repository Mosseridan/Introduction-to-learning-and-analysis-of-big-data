load('EX4q1_data.mat');

k = 4;
C = kmeans(X, k, 100);
figure(9999)
plot(X(C==1,1), X(C==1,2), '.b', X(C==2,1), X(C==2,2), 'r.', X(C==3,1), X(C==3,2), '.g', X(C==4,1), X(C==4,2), '.c');
%plot(X(find(C==1),1), X(find(C==1),2), '.b', X(find(C==2),1), X(find(C==2),2), 'r.', X(find(C==3),1), X(find(C==3),2), '.g', X(find(C==4),1), X(find(C==4),2), '.c');
