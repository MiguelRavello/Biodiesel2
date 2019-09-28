% simetria
% return bool;
function verdad=simetria(A)
  [m_row m_col]=size(A);
  verdad=true;
  for i=1:m_row
    for j=(i+1):m_col
      if(A(i,j)!=A(j,i))
        verdad=false;
        break;
      endif
    endfor
  endfor
endfunction
