%sustitucion progresiva
function rpta=sust_progresiva(A,xs)
  m_matrix=A;
  m_row=length(m_matrix(:,1));
  m_col=length(m_matrix(1,:));
  rpta=zeros(1,m_row);
  for i=1:m_row
    s=0;
    for j=1:i
      s=s+m_matrix(i,j)*rpta(1,j);
    endfor
    rpta(1,i)=(xs(1,i)-s)/m_matrix(i,i);
  endfor
endfunction
