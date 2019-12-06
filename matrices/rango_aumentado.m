%rango aumentado comparado
% M es la matrix base
% xs vector para la matriz aumentada
% xs vector fila
% t bool
function [v1,v2]=rango_aumentado(M,xs)
  A=M;
  [n m]=size(A);
  xs=xs'; %vector columna
  Ab=insertCol(M,xs);
  i=rango(A);
  j=rango(Ab);
  if(i==j)
    v1=true;
    if(n==i)
      %el sistema tiene solucion unica
      v2=true;
    else
      %tiene infinitas soluciones
      v2=false;
      %printf("tiene infinitas soluciones \n");
    endif
  else
    %no tiene solucion
    v1=false;
    v2=false;
    %printf("no tiene solucion \n");
  endif
  
endfunction
