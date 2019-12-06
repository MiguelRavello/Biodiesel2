function s=suma(A,B)
  %primero vemos si son de la misma dimension
  [m n]=size(A);
  [f c]=size(B);
  if(m==f & n==c)
    s=zeros(m,n);
    for i=1:m
      for j=1:n
        s(i,j)=A(i,j)+B(i,j);
      endfor
    endfor
  else
    error("error de dimension \n");
  endif 
endfunction