%descomposicion LU

function r=descomposicionLU(A,bs)
    [m_row m_col]=size(A);
    m_A=A;
    m_L=zeros(m_row);
    m_U=m_A;
    for j=1:(m_row-1)
        if(m_U(j,j) == 0)
            error("!La matriz A no tiene descomposicion LU! \n");
            break;
        endif
        for i=j+1:m_row
            m=m_U(i,j)/m_U(j,j);
            m_L(i,j)=m;
            for k=1:m_col
                m_U(i,k)=m_U(i,k)-m*m_U(j,k);
            endfor
        endfor
    endfor
    I=eye(m_row);
    m_L = m_L + I;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %prueba
    printf("Matriz L \n");
    m_L
    printf("Matriz U \n");
    m_U
    printf("Matriz LU \n");
    m_L*m_U
    printf("Matriz A \n");
    m_A
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    y_temp=bs;
    y=sust_progresiva(m_L,y_temp);
    r=sust_regresiva(m_U,y);
endfunction