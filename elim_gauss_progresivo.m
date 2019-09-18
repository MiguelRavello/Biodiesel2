%emiliminacion de Gauss progresivo
function r=elim_gauss_progresivo(A,xs)
  m_matrix=A;
  columna=xs';
  m_matrix=insertCol(m_matrix,columna);
  m_matrix=escalonadoSuperior(m_matrix)
  temp=m_matrix(:,length(m_matrix(1,:)));
  temp=temp'
  r=sust_progresiva(m_matrix,temp);
endfunction