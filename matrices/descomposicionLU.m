%descomposicion LU
% Ax=b
% L(Ux)=b
% L(y)=b sust_progresiva
% obtenemos como solucion y
% Ux =y       sust_regresiva
% obtenemos la solucion x
%b vector fila
%L es triangular inferior
%U es triangular superior
function [m_L,m_U]=descomposicionLU(A)
    [m_row m_col]=size(A);
    m_A=A;
    m_L=zeros(m_row);
    m_U=m_A;
    %m_I=eye(m_row);
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
                %m_I(i,k)=m_I(i,k)-m*m_I(j,k);
            endfor
        endfor
    endfor
    I=eye(m_row);
    m_L = m_L + I;
endfunction