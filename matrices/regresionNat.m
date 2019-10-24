% regresion polinomial de grado n
% a0+a1x+...+anx^n=y^
% coef=[a0:an]
% A x = b
% X=inv(A'*A)*A'*B
% Xi es vector lineal fila
% Yi es vector lineal fila
function coef=regresionNAt(Xi,Yi,n)
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
    A
    B=Yi'
    B
    coef=inv(A'*A)*A'*B;
  endif     
endfunction
