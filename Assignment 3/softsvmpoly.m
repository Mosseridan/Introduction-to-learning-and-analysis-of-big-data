function alpha = softsvmpoly(lambda, k, m, d, Xtrain, Ytrain)

    G = sparse((1 + Xtrain*Xtrain').^k);
    
    H = [((2*lambda*G)+0.5*speye(m)),sparse(zeros(m));sparse(zeros(m,2*m))];
    
    %H = H + 0.5*speye(2*m);

    f = [ sparse(zeros(m,1)) ; ones(m,1)/m ];
    
    A = -[ [sparse(bsxfun(@times, G, Ytrain)) ,speye(m,m)] ;
          [sparse(zeros(m,m)), speye(m,m) ] ];
      
    b = -[ones(m,1); sparse(zeros(m,1))];
    
    x = quadprog(H, f, A, b);
    
    alpha = x(1:m);
    
end