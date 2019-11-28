

function [V D]=algoritmoLeverrier(A)
    poli=polinomio(A);
    n=length(A);
    raiz=roots(poli);
    B=zeros(n);
    C=-1.*A(2:n,1); %columna de A
    D=diag(raiz); %valores propios en la matriz diagonal
    V=zeros(n);
    S=zeros(n,1); %vector propio
    for i=1:length(D)
        B=A(2:n,2:n)-D(i,i)*eye(n-1); %submatriz de A
        S=[1 (B\C)'];
        % vectores propios normalizados
        % cada vector propio es una columna de V
        V(1:n,i)=S/norm(S);
    endfor
endfunction
