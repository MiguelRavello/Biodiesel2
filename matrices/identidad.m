function I=identidad(m,n)
  I=zeros(m,n);
  for i=1:m
    for j=1:n
      if(i==j)
        I(i,j)=1;
      else
        I(i,j)=0;
      endif
    endfor
  endfor
endfunction
