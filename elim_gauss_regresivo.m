%emiliminacion de Gauss regresivo
function r=elim_gauss_regresivo(A,xs)
  m_matrix=A;
  columna=xs';
  m_matrix=insertCol(m_matrix,columna);
  m_matrix=escalonadoInferior(m_matrix)
  temp=m_matrix(:,length(m_matrix(1,:)));
  temp=temp'
  r=sust_regresiva(m_matrix,temp);
endfunction
