%Escolhe-se um vetor com o clique do mouse
%Implementada uma iteracao do metodo das potencias
%pra cada vez que a tecla espaco for pressionada.
%A cada iteracao é mostrado o vetor resultante
%e impresso os erros de aproxima碘o do autovalor e 
%de alinhamento do autovetor a cada iteracao.

%Matriz A 
A = [2,-1; -1 -5]

% Decomposicao 
[V,D] = eig(A);

% Indice do autovalor dominante
[~,j] = max(max(abs(D))); 

% Plot inicial
figure(1);
quiver(0,0,V(1,j),V(2,j),'Color','k','LineWidth',3,'AutoScale','off');
box on;
grid on;
axis([-1,1,-1,1]);
axis 'manual';

button = -1;
u = [];
v = [];
y = [];
erro_autovalor = []; 
while button~=27		
	[u0,v0,button] = ginput(1);	
	if button==1
		u = u0; 
		v = v0;
    x = [u,v];	
    k = 0; kmax = 1000; erro_autovetor = inf;
    n = size(A,1); y0 = zeros(n,1); y0(1) = 1;
    aux = y0;
	end
	if button==32
		% TAREFAS
		% 1. Implemente uma iteracao do metodo das potencias
		%     pra cada vez que a tecla espaco for pressionada. 
		%     Use o vetor x = [u; v] como chute inicial.
		% 2. Visualize o vetor resultante a cada iteracao.
		% 3. Imprima os erros de aproxima碘o do autovalor e 
		%     de alinhamento do autovetor a cada iteracao.	)
    x = A*y0;
    y = x/norm(x);
    erro_autovetor = abs(abs(y0'*y)-1);
    disp('erro_autovetor =');
    disp(erro_autovetor);

    lambda = y'*A*y;
    erro_autovalor = norm(lambda - aux);
    aux = lambda;
    disp('erro_autovalor =');
    disp(erro_autovalor);
    printf('\n');
    
    y0 = y;
    k = k+1;
	end	
	
	quiver(0,0,V(1,j),V(2,j),'Color','k','LineWidth',3,'AutoScale','off');
	if size(u,1)>0
		hold on;
		quiver(0,0,u,v,'Color','r','LineWidth',3,'AutoScale','off');
		hold off;
	end
  if size(y,1)>0
    hold on;
	  quiver(0,0,y(1),y(2),'Color','b','LineWidth',3,'AutoScale','off');
	  hold off;
  end

	box on;
	grid on;
	axis([-1,1,-1,1]);
	axis 'manual';
	pause(0.1);
end
close(1);
