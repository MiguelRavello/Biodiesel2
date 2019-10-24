% cholesky
% si la matriz es simetrica y positiva definida
% admite descomposicion A=G*G'
function verdad=cholesky(A)
  [fila col]=size(A);
  verdad=true;
  if (fila!=col)
    error(" tiene que ser una matriz cuadratica \n");
  else
    if(simetria(A))
      for i=1:fila
        if (det(A(1:i,1:i))<=0)
          verdad=false;
          break;
        endif
      endfor  
    endif
  endif
endfunction
