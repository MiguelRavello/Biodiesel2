%descomposicion LU
% Ax=b
% A=LU
% L(Ux)=b
% L(y)=b sust_progresiva
% obtenemos como solucion y
% Ux =y       sust_regresiva
% obtenemos la solucion x
%b vector fila
%L es triangular inferior
%U es triangular superior
function X=descomposicionLU(A,b)
    [m_L,m_U]=descomposicionLU(A);
    y=sust_progresiva(m_L,b);
    X=sust_regresiva(m_U,y);
endfunction