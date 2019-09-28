% determinante
function det=determinante(A)
    m_matrix=A;
    [m_row m_col]=size(A);
    n=0;  
    det=1;
    for j=1:(m_row-1)
      % max_val elemento pivote
      max_val=m_matrix(j,j);
      max_file=j;
      for x=(j+1):m_row
        % hallando el valor maximo para q sea pivote */
        if(max_val<abs(m_matrix(x,j)))
          max_val=abs(m_matrix(x,j));
          max_file=x;
          n=n+1; % es para (-1)^n
        endif
      endfor
      % donde esta la fila con el valor q va ser pivote
      % se lo lleva para arriba
      if(j!=max_file)
        m_matrix=swapRow(m_matrix,j,max_file);
      endif
      % f1=f1-mf2
      % m21=a21/a11;
      for i=(j+1):m_row
        m=m_matrix(i,j)/m_matrix(j,j);
        for k=1:m_col
          m_matrix(i,k)=m_matrix(i,k) - m*m_matrix(j,k);
        endfor
      endfor
    endfor
    for i=1:m_row
      det=det*m_matrix(i,i);
    endfor
    det=det*(-1)^n;  
endfunction