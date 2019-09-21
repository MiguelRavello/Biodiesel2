%swap de filas 
function X=swapRow(A,f1,f2)
  X=A;
  if(f1>length(A(:,1)) || f2>length(A(:,1)))
    error("las filas no se pueden intercambiar \n");
  else
    %X(f1,:)=A(f2,:);
    %X(f2,:)=A(f1,:);
    for j=1:length(X(1,:))
      X(f1,j)=A(f2,j);
      X(f2,j)=A(f1,j);
    endfor
  endif
endfunction
