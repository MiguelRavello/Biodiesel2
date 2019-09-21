% A = matrix inicial
% b = columna
% Ab = matriz aumentada
function Ab=insertCol(A,b)
  if(length(A(:,1))==length(b(:,1)))
    m=length(A(:,1)); %filas de A
    n=length(A(1,:))+length(b(1,:)); %columnas de A+b
    Ab=zeros(m,n); %redimensionando
    for i=1:m
      for j=1:n
        if(j<=length(A(1,:)))
          Ab(i,j)=A(i,j);
        else
          Ab(i,j)=b(i,j-length(A(1,:)));
        endif
      endfor
    endfor
  else
    error("error de dimension \n");
  endif
endfunction