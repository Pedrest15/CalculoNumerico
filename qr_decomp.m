function [Q,R] = qr_decomp(A)
%aplica a decomposição QR em uma matriz quadrada A
%Q: matriz (m,n)
%R: matriz triangular superior

  [m,n] = size(A);
  V = A;
  Q = zeros(m,n);
  R = zeros(n,n);
  for i=1:n
    R(i,i) = norm(V(:,i));
    Q(:,i) = V(:,i)/R(i,i);
    for j=i+1:n
      R(i,j) = Q(:,i)'*V(:,j);
      V(:,j) = V(:,j)- R(i,j)*Q(:,i);
    end
  end
endfunction
