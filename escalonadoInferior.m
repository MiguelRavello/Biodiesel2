%escalonamiento con pivote inferior
function m_matrix=escalonadoInferior(A)
    m_matrix=A;
    m_row=length(m_matrix(:,1));
    m_col=length(m_matrix(1,:));
    for j=1:(m_row-1)
      % max_val elemento pivote
      max_val=m_matrix(j,j);
      max_file=j;
      for x=(j+1):m_row
        % hallando el valor maximo para q sea pivote */
        if(max_val<m_matrix(x,j))
          max_val=m_matrix(x,j);
          max_file=x;
        endif
      endfor
      % donde esta la fila con el valor q va ser pivote
      % se lo lleva para arriba
      if(j!=max_file)
        m_matrix=swapRow(m_matrix,j,max_file);
      endif
      for i=(j+1):m_row
        m=m_matrix(i,j)/m_matrix(j,j);
        for k=1:m_col
          m_matrix(i,k)=m_matrix(i,k) - m*m_matrix(j,k);
        endfor
      endfor
    endfor
endfunction