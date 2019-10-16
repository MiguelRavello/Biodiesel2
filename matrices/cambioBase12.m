% Matriz de cambio de base de 1 a 2
% B1={u1,u2,...,un}
% B2={v1,v2,...,vn}
% u1=a1*v1+a2*v2+...+an*vn
% (u1,u2,...,un)=(v1,v2,v3,...,vn)* Mb1b2
% B1 = B2 * Mb1->b2
% M=B2^-1 *B1
function M=cambioBase12(A,B)
  B1=A';
  B2=B';
  M= inversa(B2)*B1;
endfunction
