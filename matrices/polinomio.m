%polinomio caracteristico de A
function p=polinomio(A)
  [n m]=size(A);
  if (n==m)
    p=zeros(1,n); #vector de coef del polinomio
    Mi=I=eye(n);
    for i=1:n
      T=A*Mi; #matriz para sumar su diagonal principal
      p(i)=(-1/i)*trace(T);
      Mi=T+p(i)*I;
    endfor
    p=[1 p];
  else
    error("no es una matriz cuadrada")
  endif
endfunction