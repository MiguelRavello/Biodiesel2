% descomposicionCholesky
% AX=b
% (G*G')X=b
% G'X=Y   
% GY=b  %sustitucion progresiva
% con Y solucionamos G'X=Y con  sustitucion regresiva
function X=solucionCholesky(A,b)
    [G,Gt]=descomposicionCholesky(A)
    Y=sust_progresiva(G,b); %G*Y=b
    X=sust_regresiva(Gt,Y); %Gt*X=Y
endfunction