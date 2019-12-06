%descomposicion PLU
% A matriz
% bs para la matriz aumentada
% bs vector fila
% PA = LU
% Ax=b
% P*b = y_temp
% L(Ux)=(P*b)
% L(y)=y_temp sust_progresiva
% Ux=y   sust_regresiva
function [m_P,m_L,m_U]=descomposicionPLU(A)
  [m_row m_col]=size(A);
  m_A = A;
  m_P = eye(m_row);
  m_L = zeros(m_row);
  m_U = A;
  for j=1:(m_row - 1)
    max_val=m_U(j,j);
    max_file=j;
    for x=(j+1):m_row
      if(max_val<abs(m_U(x,j)))
        max_val=m_U(x,j);
        max_file=x;
      endif
    endfor
    if(j!=max_file)
        m_U=swapRow(m_U,j,max_file);
        m_P=swapRow(m_P,j,max_file);
        m_L=swapRow(m_L,j,max_file);
    endif
    for i=(j+1):m_row
        m=m_U(i,j)/m_U(j,j);
        m_L(i,j)=m;
        for k=1:m_col
          m_U(i,k)=m_U(i,k)-m*m_U(j,k);
        endfor
    endfor
  endfor
  I=eye(m_row);
  m_L = m_L + I;
endfunction