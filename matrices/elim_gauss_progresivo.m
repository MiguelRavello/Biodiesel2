%emiliminacion de Gauss progresivo
% r vector solucion
function r=elim_gauss_progresivo(A,xs)
  m_matrix=A;
  columna=xs';
  verdad=rango_aumentado(A,xs);
  if(verdad)
    m_matrix=insertCol(m_matrix,columna);
    m_matrix=escalonadoSuperior(m_matrix)
    [n m]=size(m_matrix);
    temp=m_matrix(:,m);
    temp=temp'
    r=sust_progresiva(m_matrix,temp);
  else
    error("no se puede operar \n");
  endif
endfunction