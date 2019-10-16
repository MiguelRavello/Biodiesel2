% Sea el conjunto de vectores
% B={u1,u2,...,un}
% Tal que B sea L.i.
% Span(B)=V, V es un espacio vectorial
function verdad=esBase(B)
  [m n]=size(B);
  ceros=zeros(1,m);
  u=descomposicionPLU(B,ceros);
  %u tiene q ser un vector cero, para q sea l.i.
  for i=1:length(u)
    if(u(i)!=0)
      verdad=false;
      break;
    endif
  endfor
endfunction