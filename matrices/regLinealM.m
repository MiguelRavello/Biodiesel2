%%X=inv(A' * A) * A' * B;
% regresion lineal Matricial
function X=regLinealM(A,B)
  X=inversa(A' * A) * A' * B; 
endfunction