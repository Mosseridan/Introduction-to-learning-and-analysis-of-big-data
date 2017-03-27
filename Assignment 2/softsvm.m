function w = softsvm(lambda, m, d, Xtrain, Ytrain)
    
    H = diag( [ 2*lambda*ones(d,1) ; sparse(zeros(m,1)) ] );
    
    f = [ sparse(zeros(d,1)) ; ones(m,1)/m ];
    
    A = -[ [sparse(bsxfun(@times, Xtrain, Ytrain)) ,speye(m,m)] ;
          [sparse(zeros(m,d)), speye(m,m) ] ];
      
    b = -[ones(m,1); sparse(zeros(m,1))];
    
    x = quadprog(H, f, A, b);
    
    w = x(1:d);
end