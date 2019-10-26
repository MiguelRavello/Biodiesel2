#proceso Gram Schmith columna -> QR
# vi= es vector-columna
% siendo A={v1,v2,...,vn} son base de un espacio vectorial V
# Ui=(Wi)/|Wi|
# Wi=vi-combinacionLineal
# combinacionLineal= S<vi,uj>*uj from j=1 to i-1 
% Q es el proceso GramSchmith en columnas
% R es una matriz triangular superior
function [Q R]=descomposicionQR(A)
  [f c]=size(A);
  Q=zeros(f,c);
  R=zeros(c,c);
  for i=1:c
    v=A(:,i);
    combinacionLineal=zeros(f,1);
    for j=1:(i-1)
      u=Q(:,j);
      R(j,i)=sum(v.*u);
      combinacionLineal=combinacionLineal+R(j,i)*u;
    endfor
    Wi=v-combinacionLineal;
    R(i,i)=sqrt(sum(Wi.*Wi));
    Q(:,i)=Wi/R(i,i);
  endfor
endfunction