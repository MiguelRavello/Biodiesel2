% matrix inversa

function inv=inversa(matrix)
    A=matrix;
    inv=eye(m_row,m_col);
    inv.identidad();
    %escalonamiento inferior 000
    for j=1:(m_row-1)
        max_val=A(j,j);
        max_file=j;
        %identificacion del mayor valor en la columna j
        for x=(j+1):m_row
            if(max_val<A(x,j))
                max_val=A(x,j);
                max_file=x;
            endif
        endfor
        if(j!=max_file)
            A=swapRow(A,j,max_file);
            inv=swapRow(inv,j,max_file);
        endif
        %Resta de Filas para escalonar
        for i=(j+1):m_row
            m=A(i,j)/A(j,j);
            for k=1:m_col
                A(i,k)=A(i,k) - m*A(j,k);
                inv(i,k)=inv(i,k) - m*inv(j,k);
            endfor
        endfor
    endfor
    % igualando a 1 la diagonal principal
    for i=1:m_row
        max_val=A(i,i);
        for j=1:m_col
            A(i,j)=A(i,j)/max_val;
            inv(i,j)=inv(i,j)/max_val;
        endfor
    endfor
    %escalonamimento superior 000
    for j=m_row:-1:2
        for i=(j-1):-1:1
            m=A(i,j)/A(j,j);
            for k=1:m_col
                A(i,k)=A(i,k) - m*A(j,k);
                inv(i,k)=inv(i,k) - m*inv(j,k);
            endfor
        endfor
    endfor
endfunction