% Regresion Lineal
% A=[1 x1;1 x2;...;1 xn]
% B=[y1 y2 y3 ... yn]' (transpuesta)
% y = a+bx
% Sy=na+bSx
% Sxy=aSx+bSx^2
% nSxy=naSx+nbSx^2
% naSx=nSxy-nbSx^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% a=(Sy-bSx)/n
% SxSy-b(Sx)^2=nSxy-nbSx^2
% nbSx^2-b(Sx)^2=nSxy-SxSy
% b(nSx^2-(Sx)^2)=nSxy-SxSy
% b(nSx^2-(Sx)^2)=nSxy-SxSy
% b=(nSxy-SxSy)/(nSx^2-(Sx)^2)
function [a b]=regresionLineal(A,B)
  %X=inv(A' * A) * A' * B;
  Sy=sum(B);
  Sxy=sum(A.*B);
  SxSy=sum(A)*sum(B);
  Sx2=sum(A.^2);
  Sx=sum(A);
  n=length(A);
  b=(n*Sxy-SxSy)/(n*Sx2-(Sx)^2);
  a=(Sy-b*Sx)/n;
endfunction