load('EX4q1_data.mat');
t = 100;
objectives = zeros(9,1);
colors = ['.y','.m','.c','.r','.g','.b'];
hold on

for k = 2:10
    C = kmeans(X, k, t);
    figure(t+k);
    %for i = 1:min(k,6)
    %   plot(X(C==i,1), X(C==i,2), colors(i)) 
    %end
    plot(X(C==1,1), X(C==1,2), '.b', X(C==2,1), X(C==2,2), 'r.', X(C==3,1), X(C==3,2), '.g', X(C==4,1), X(C==4,2), '.c',X(C==5,1), X(C==5,2), '.y', X(C==6,1), X(C==6,2), '.k', X(C==7,1), X(C==7,2), '.m');
    title(sprintf('Clustering for k = %d', k));
    xlabel('x1');
    ylabel('x2');
    
    for i =1:k
         Ci = X(C == i,:);
         Ci_length = size(Ci,1);
         average = mean(Ci);
         for j = 1:Ci_length
            objectives(k-1) = objectives(k-1) + norm(Ci(j,:) - average)^2;
         end
    end
end

figure(999999);
plot(2:10,objectives, '--*');
title('Objective(k)');
xlabel('k');
ylabel('Objective');