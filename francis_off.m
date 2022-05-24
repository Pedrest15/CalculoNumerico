function [V,D,k,erros] = francis_off(A,tol)
%função que aplica o método de Francis para calcular os autovalores e os autovetores 
%de uma matriz quadrada A, o critério de parada adotado foi o cáculo de off(A)

%V: autovetores de A
%D: autovalores de A, retornam de forma ordenada decrescente
%k: número de iterações que o algoritmo realizou
%erros: vetor que guarda o erro em cada iteração

  n = size(A,1);
  V = eye(n);
  off = inf;
  k = 0;
  erros = []; %matriz de uma linha
  while off>tol
    [Q,R] = qr_decomp(A);
    A = R*Q;
    V = V*Q;
    off = sqrt(norm(A,'fro')^2 - sum(diag(A).^2));
    erros(end+1) = off;
    k += 1;
  end
  D = diag(A);
  D = sort(D, "descend");
endfunction
