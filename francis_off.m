function [V,D,k,erros] = francis_off(A,tol)
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
