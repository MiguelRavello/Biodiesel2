%escalonamiento reducido
function m_matrix=escalonadoReducido(A)
    m_matrix=A;
    [m_row m_col]=size(A);
    for j=1:(m_row-1)
        % max_val elemento pivote
        max_val=m_matrix(j,j);
        max_file=j;
        for x=(j+1):m_row
            % hallando el valor maximo para q sea pivote 
            if(max_val<abs(m_matrix(x,j)))
                max_val=m_matrix(x,j);
                max_file=x;
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
    % igualando a 1 la diagonal principal
    for i=1:m_row
        max_val=m_matrix(i,i);
        for j=1:m_col
            m_matrix(i,j)=m_matrix(i,j)/max_val;
        endfor
    endfor
    % escalonamimento superior 000
    for j=m_row:-1:2
        for i=(j-1):-1:1
            m=m_matrix(i,j)/m_matrix(j,j);
            for k=1:m_col
                m_matrix(i,k) = m_matrix(i,k) - m*m_matrix(j,k);
            endfor
        endfor
    endfor
endfunction