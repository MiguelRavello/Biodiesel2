%rango aumentado comparado
% M es la matrix base
% xs vector para la matriz aumentada
% t bool
function t=rango_aumentado(M,xs)
  A=M;
  [n m]=size(A);
  xs=xs';
  Ab=insertCol(M,xs);
  i=rango(A);
  j=rango(Ab);
  if(i==j)
    if(n==i)
      %el sistema tiene solucion unica
      t=true;
    else
      %tiene infinitas soluciones
      t=false;
      printf("tiene infinitas soluciones \n");
    endif
  else
    %no tiene solucion
    t=false;
    printf("no tiene solucion \n");
  endif
  
endfunction
