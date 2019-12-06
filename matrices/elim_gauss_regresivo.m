%emiliminacion de Gauss regresivo
% r vector solucion
function r=elim_gauss_regresivo(A,xs)
  m_matrix=A;
  columna=xs';
  [v1,v2]=rango_aumentado(A,xs);
  if(v2)
    %matriz aumentada insertando una columna a la matriz A
    m_matrix=insertCol(m_matrix,columna);
    m_matrix=escalonadoInferior(m_matrix)
    %hago un get de la ultima columna
    [n m]=size(m_matrix);
    temp=m_matrix(:,m);
    temp=temp'
    r=sust_regresiva(m_matrix,temp);
  else
    error("no se puede operar \n");
  endif
endfunction
