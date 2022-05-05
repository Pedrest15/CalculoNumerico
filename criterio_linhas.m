function y = criterio_linhas(A)
% aplica o critério das linhas para saber se uma série vai convergir no critério de Gauss-Jacobi
% se retornar 1, converge, senão, inconclusivo. Condição necessária, mas não suficiente
  n = size(A,1);
  y = 1;
  
  for i=1:n
    x = 0;
    for j=1:n
      if j ~= i
        x += abs(A(i,j)) / abs(A(i,i));
      endif
    endfor
    if x > 1
      y = 0;
      break
    endif
  endfor
endfunction
