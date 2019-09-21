function teta=angulo(A,B)
  ab=punto(A,B);
  na=norma(A);
  nb=norma(B);
  teta=acos(ab/(na*nb))*(180/pi);
endfunction