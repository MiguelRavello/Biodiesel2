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

def transformarPuntos(partida,llegada,Matrix,puntos):
    (f,c)=Matrix.shape;
    (m,n)=puntos.T.shape;
    R=np.array([puntos[0]]);
    R=np.delete(R,0,0); #creo una matrix vacia
    if((f,c)==(llegada,partida) and c==m):
        for i in range(n):
            xs=np.array([puntos[i]]);
            ys=np.matmul(Matrix,xs.T).T;
            R=np.append(R,ys,axis=0);
        return R;
    else:
        print("La matriz correspondiente no es correcta");

def dibujarPuntos(puntos):
    O=np.array([puntos[0]]);
    llegada=puntos;
    llegada=np.delete(llegada,0,0);
    llegada=np.append(llegada,O,axis=0);
    origen=puntos.T;
    llegada=llegada.T;
    llegada=llegada-origen;
    ox=origen[0];
    oy=origen[1];
    lx=llegada[0];
    ly=llegada[1];
    plt.quiver(ox,oy,lx,ly,color=['r'],scale=10);
    plt.xlim(0,10);
    plt.ylim(-2,8);
    plt.grid(b=True, which='major');
    plt.show();

def dibujar2D(u,v):
    origin=[0],[0];
    plt.quiver(*origin,u,v,color=['r','b'],scale=10);
    plt.xlim(-5,5);
    plt.ylim(-5,5);
    plt.grid(b=True, which='major');
    plt.show();

def main():
    T=np.array([[1,2],[2,-1]]);
    points=np.array([[0,0],[0,2],[1,3],[2,2],[2,0]]);
    u=transformarPuntos(2,2,T,points);
    print(u);
    dibujarPuntos(points);
    dibujarPuntos(u);
