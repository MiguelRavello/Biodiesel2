function [V,D]=leverrier(A)    
    %V vectores propios en columnas
    % D valores propios en la diagonal de la matriz
    n=length(A); %dimensión de la matriz
    p=zeros(1,n); %reserva memoria para n elementos
    s=zeros(n,1);
    B=zeros(n); %reserva memoria para la matriz cuadrada de dimensión n 
    for i=1:n
        B=A^i; %potencia de la matriz A
    %calcula la traza de las sucesivas potencias de la matriz A     
    s(i)=trace(B);
    end
    %calcula los coeficientes del polinomio característico
    p(1)=-s(1);
    for i=2:n
        p(i)=-s(i)/i;
        for j=1:i-1
            p(i)=p(i)-p(j)*s(i-j)/i;
        end
    end
    %raíces del polinomio característico
    raiz=roots([1 p]); 
    %Los valores propios aparecen en la diagonal de la matriz D
    D=diag(raiz);
    %Vectores propios para cada valor propio 
    C=-1.*A(2:n,1); %columna de A
    V=zeros(n);
    S=zeros(n,1); %vector propio
    for i=1:length(D)
        B=A(2:n,2:n)-D(i,i)*eye(n-1); %submatriz de A
        S=[1 (B\C)'];
        % vectores propios normalizados
        %cada vector propio es una columna de V
        V(1:n,i)=S/norm(S); 
    end
end