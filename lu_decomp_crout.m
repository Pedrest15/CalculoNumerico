function [L,U] = lu_decomp_crout(A)
% faz a decomposição LU de uma matriz quadrada a partir do método de Crout
% A: matriz quadrada
% L, U: matrizes triang. inf. e sup., respectivamente
n = size(A,1);
L = zeros(n); U = eye(n);
for k=1:n
  for i=1:n
    if i >= k
      L(i,k) = A(i,k) - L(i,1:k-1) * U(1:k-1,k)
    end
   end
   for j=1:n
     if j > k
      U(k,j) = (A(k,j) - L(k,1:k-1) * U(1:k-1,j)) / L(k,k)    
     end
   end
end
