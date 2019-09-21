%Rango
%A matriz para escalonar 
%contador, cuenta numero de filas no nulas
function contador=rango(A)
  C=A;
  [m_row m_col]=size(A);
  verdad=true; %empieza con q es fila nula
  contador=m_row;
  C=escalonadoInferior(C);
  for i=1:m_row
    for j=1:m_col
      if(C(i,j)!=0); %apenas haye un numero en la fila 
        verdad=false;
      endif
    endfor
    if(verdad)
      contador=contador-1;
    endif
    verdad=true;
  endfor
endfunction
