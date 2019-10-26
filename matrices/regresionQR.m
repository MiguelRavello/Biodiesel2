% regresion polinomial de grado n 
# por descomposicion QR
% a0+a1x+...+anx^n=y^
% coef=[a0:an]
% A x = b
% X=inv(A'*A)*A'*B
% Xi es vector lineal fila
% Yi es vector lineal fila
% n es el tipo de regresion a utilizar
function coef=regresionQR(Xi,Yi,n)
  if (n<1)
    error("no hay regresion");
  elseif (length(Xi)==length(Yi))
    x0=ones(length(Xi),1);
    xi=Xi';
    A=zeros(length(Xi),n+1);
    A(:,1)=x0;
    for i=1:n
      xi=xi.^i;
      A(:,i+1)=xi;
    endfor
    [Q R]=descomposicionQR(A);
% Q base ortonormal -> Q'==inv(Q)
% R matrix diagonal superior
    B=Yi';
    b=Q'*B;
% R*X=Q'*B
    coef=sust_regresiva(R,b');
  else
    error("las listas Xi e Yi estan mal dimensionadas");
  endif     
endfunction