function p=punto(A,B)
  p=0;
  if(length(A)==length(B))
    i=1;
    while(i<=length(A))
      p=p+A(i)*B(i);
      i=i+1;
    endwhile
  endif   
endfunction
