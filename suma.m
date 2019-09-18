function s=suma(A,B)
  %primero vemos si son de la misma dimension
  if(length(A(:,1))==length(B(:,1))&&length(A)==length(B))
    s=zeros(length(A),length(A(:,1)));
    fila=length(A);
    columna=length(A(:,1));
    for i=1:fila
      for j=1:columna
        s(i,j)=A(i,j)+B(i,j);
      end
    end
  else
    error("error de dimension \n");
  end 
endfunction