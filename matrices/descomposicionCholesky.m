% descomposicionCholesky
% AX=b
% (G*G')X=b
% G'X=Y   
% GY=b  %sustitucion progresiva
% con Y solucionamos G'X=Y con  sustitucion regresiva
function [G,Gt]=descomposicionCholesky(A,b)
  if (cholesky(A))
    [m_row m_col]=size(A);
    G=zeros(m_row,m_col);
    G(1,1)=sqrt(A(1,1));
    for i=2:m_row
      for j=1:i
        if(j==1)
          G(i,1)=A(i,1)/G(1,1);
        elseif (i==j)
          temp=0;
          for k=1:(i-1)
            temp = temp + (G(i,k))^2;
          endfor
          G(i,i)=sqrt(A(i,i)-temp);
        else
          temp=0;
          for k=1:(j-1)
            temp=temp + G(i,k)*G(j,k);
          endfor
          G(i,j)=(A(i,j)-temp)/G(j,j);
        endif
      endfor
    endfor
    Gt=G';
  else
    error("no tiene descomposicion de Cholesky \n");
  endif
endfunction