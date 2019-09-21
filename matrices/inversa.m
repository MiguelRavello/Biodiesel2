% matrix inversa

function inv=inversa(matrix)
  [m_row m_col]=size(matrix);
  if(m_row==m_col)
    filas_no_nulas=rango(matrix);
    if(filas_no_nulas==m_row)
      A=matrix;
      inv=eye(m_row,m_col);
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
          %en el caso q el elemento pivote sea cero
          %hallamos el valor mas negativo
          if(max_val==0)
            for x=(j+1):m_row
              if(max_val>A(x,j))
                max_val=A(x,j);
                max_file=x;
              endif
            endfor
          endif
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
    else
      printf("no tiene inversa dado que tiene filas nulas \n");
    endif
  else
    printf("dimensionalmente incorrecto \n");
  endif
endfunction