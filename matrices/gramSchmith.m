#proceso Gram Schmith filas
# vi= es vector-fila
% siendo B={v1;v2;...;vn} son base de un espacio vectorial V
# Ui=(Wi)/|Wi|
# Wi=vi-combinacionLineal
# combinacionLineal= S<vi,uj>*uj from j=1 to i-1 

function G=gramSchmith(B)
  [f c]=size(B);
  G=zeros(f,c);
  for i=1:f
    v=B(i,:);
    combinacionLineal=zeros(1,c);
    for j=1:(i-1)
      u=G(j,:);
      combinacionLineal=combinacionLineal+(sum(v.*u))*u;
    endfor
    Wi=v-combinacionLineal;
    modulo=1/sqrt(sum(Wi.*Wi));
    G(i,:)=modulo*Wi;
  endfor
endfunction