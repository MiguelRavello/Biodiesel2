% regresion polinomial de grado n
% a0+a1x+...+anx^n=y^
% coef=[a0:an]
% A x = b
% G*G' x=b
function coef=regresionN(Xi,Yi,n)
  if (n<1)
    error("no hay regresion");
  elseif (length(Xi)==length(Yi))
    Sxn=[1:(2*n)];
    Syxn=[1:(n+1)];
    Syxn(1)=sum(Yi);
    for i=1:(2*n)
      Sxn(i)=sum(Xi.^i);
    endfor
    for j=1:n
      Syxn(j+1)=sum(Yi.*(Xi.^j));
    endfor
    A=zeros(n+1);
    A(1,1)=length(Xi);
    for i=1:(n+1)
      for j=1:(n+1)
        if (i==1 && j==1)
          continue;
        endif
        A(i,j)=Sxn(i+j-2);
      endfor
    endfor
    printf("Matriz formada por las sumatorias de Xi\n");
    A
    printf("Vector que representa B de Ax=B\n");
    Syxn
    coef=descomposicionCholesky(A,Syxn);
  else
    error("esta mal dimensionado las listas Xi y Yi");
  endif
endfunction
