#escalonado sin pivote

function m_matrix=escalonadoSimple(A)
    m_matrix=A;
    [m_row m_col]=size(A);
    for j=1:(m_row-1)
      % f1=f1-mf2
      % m21=a21/a11;
      for i=(j+1):m_row
        m=m_matrix(i,j)/m_matrix(j,j);
        for k=1:m_col
          m_matrix(i,k)=m_matrix(i,k) - m*m_matrix(j,k);
        endfor
      endfor
    endfor
endfunction