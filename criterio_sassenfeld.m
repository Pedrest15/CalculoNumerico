function x = criterio_sassenfeld(A)
  % aplica o critério de sassenfeld para saber se uma série vai convergir no critério de Gauss-Seidel
  % se retornar 1, converge, senão, inconclusivo. Condição necessária, mas não suficiente
  % A: matriz quadrada
  n = size(A,1);
  x = 1;

  b = zeros(n,1);
  b(1) = sum(abs(A(1,2:n)))/abs(A(1,1));
  for i=2:n
    b(i) = (abs(A(i,1:i-1))*b(1:i-1) + sum(abs(A(i,i+1:n)))) / abs(A(i,i));
    % a primeira parcela é uma multiplicação de uma matriz linha por um vetor,
    % logo, retorna um único escalar
    if b(i) >= 1
      x = 0;
      break
    endif
  endfor
endfunction
