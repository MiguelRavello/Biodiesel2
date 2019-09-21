%sustitucion regresiva
%A matrix de nxm
%xs es un vector fila
function rpta=sust_regresiva(A,xs)
  m_matrix=A;
  m_row=length(m_matrix(:,1));
  m_col=length(m_matrix(1,:));
  rpta=zeros(1,m_row);
  for i=m_row:-1:1
    s=0;
    for j=i:m_row
      s=s+m_matrix(i,j)*rpta(1,j);
    endfor
    rpta(1,i)=(xs(1,i)-s)/m_matrix(i,i);
  endfor
endfunction
