import numpy as np
import matplotlib.pyplot as plt
# T(x,y)=(u,v)
#               Rm -> Rn , Matrix T, vector a transformar
def transformar(partida,llegada,T,v):
    (f,c)=T.shape; #(filas,col)
    (n,m)=v.T.shape; #(filas,col) del vector transpuesto
    if((f,c)==(llegada,partida) and c==n):
        return np.matmul(T,v.T).T; #se obtiene una matriz de fxc
    else:
        print("La matriz T no es correcta");

def dibujar2D(u,v):
    origin=[0],[0];
    plt.quiver(*origin,u,v,color=['r','b'],scale=10);
    plt.xlim(-5,5);
    plt.ylim(-5,5);
    plt.grid(b=True, which='major');
    plt.show();

#producto punto
def productoInterno(u,v):
    (t1,)=u.shape;
    (t2,)=v.shape;
    s=0;
    if (t1!=t2):
        print("error");
    else:
        for i in range(t1):
            s=s+ u[i]*v[i];
    return s;


#proceso gram-schmith
def gramSchmith(Base):
    (f,c)=Base.shape;
    Gram=np.full((f,c),0);
    temp=Gram[0];
    for i in range(f):
        temp2=temp;
        for j in range(i):
            temp2=temp2+productoInterno(Base[i],Gram[j])*Gram[j];
        print(temp2);
        Gram[i]=Base[i]-temp2;
        print(Gram);
        Gram[i]=Gram[i]/(np.sqrt(productoInterno(Gram[i],Gram[i])));
    return Gram;

def main():
    T=np.array([[2,1],[1,-1]]);
    v=np.array([[1,2]]);
    u=transformar(2,2,T,v);
    w=np.array([u,v]);
    w=w[:,0];
    print(w[:,0]);
    print(w[:,1]);
    dibujar2D(w[:,0],w[:,1]);

