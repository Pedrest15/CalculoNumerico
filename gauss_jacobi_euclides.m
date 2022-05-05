function [x,k]=gauss_jacobi_euclides(A,b,x0,tol)
  n = size(A,1);
  D = diag(diag(A));
  C = eye(n)-D\A;
  g = D\b;
  kmax = 10000; k = 1;

  x = C*x0 + g;
  while (norm(x - x0) / norm(x)>tol && k<kmax)
    k = k+1;
    x0 = x;
    x = C*x0+g;
  end
  if (k == kmax)
    disp('Erro: o metodo nao converge.');
    return;
  end
