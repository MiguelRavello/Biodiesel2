%descomposicion PLU
%A matriz
%bs para la matriz aumentada
function x=descomposicionPLU(A,bs)
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
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %prueba
  printf("Matriz P \n");
  m_P
  printf("Matriz L \n");
  m_L
  printf("Matriz U \n");
  m_U
  printf("Matriz PA \n");
  m_P*m_A
  printf("Matriz LU \n");
  m_L*m_U
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  bs=bs';
  printf("Matriz P*bs")
  PB=m_P*bs
  [fila col]=size(PB);
  y_temp=(PB(:,col))'; %vector fila
  y=sust_progresiva(m_L,y_temp);
  x=sust_regresiva(m_U,y);
endfunction