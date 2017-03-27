function w = get_w(alpha,Xtrain)
    w = zeros(1,10);
    for i = 1:1000
       alphai = alpha(i);
       xi = Xtrain(i,:);
       psixi = [1,xi(1),xi(2),xi(1)*xi(2),xi(1)^2,xi(2)^2,xi(1)^2*xi(2),xi(1)*xi(2)^2,xi(1)^3,xi(2)^3];
       w = w + alphai*psixi;
    end
end

