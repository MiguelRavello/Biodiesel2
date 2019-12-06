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
function x=solucionPLU(A,bs)
  [m_P,m_L,m_U]=descomposicionPLU(A);
  bs=bs'; %vector columna
  %printf("Matriz P*bs \n");
  PB=m_P*bs;
  [fila col]=size(PB);
  y_temp=(PB(:,col))'; %vector fila
  y=sust_progresiva(m_L,y_temp);
  x=sust_regresiva(m_U,y);
endfunction