import numpy as np
import matplotlib.pyplot as plt
import math
from mpl_toolkits.mplot3d import Axes3D

def rotar(punto,angulo):
    #matrix de rotacion
    n=len(punto);
    R=np.eye(n);
    rad=angulo*(math.pi/180);
    R[0][0]=math.cos(rad);
    R[0][1]=-math.sin(rad);
    R[1][0]=math.sin(rad);
    R[1][1]=math.cos(rad);
    #------------------
    v=np.array([punto]);
    return np.matmul(R,v.T).T;

#siendo u, v
# vectores en Rn
def dibujar(u,v):
    n=len(v);
    A=np.array([u,v]);
    A=A.T;
    if(n==2):
        x=A[0];
        y=A[1];
        origin=[0],[0];
        plt.quiver(*origin,x,y,color=['r','b'],scale=10);
        plt.xlim(-10,10);
        plt.ylim(-10,10);
        plt.grid(b=True, which='minor');
        plt.show();
    elif(n==3):
        fig=plt.figure();
        ax=fig.add_subplot(111,projection='3d');
        #-----
        x=A[0];
        x1=np.linspace(0,x[0],10);
        x2=np.linspace(0,x[1],10);
        x=np.array([x1,x2]);
        x=x.ravel();
        y=A[1];
        y1=np.linspace(0,y[0],10);
        y2=np.linspace(0,y[1],10);
        y=np.array([y1,y2]);
        y=y.ravel();
        z=A[2];
        z1=np.linspace(0,z[0],10);
        z2=np.linspace(0,z[1],10);
        z=np.array([z1,z2]);
        z=z.ravel();
        #--------
        ax.scatter(x,y,z, c='r',marker='o');
        ax.set_xlabel('x');
        ax.set_ylabel('y');
        ax.set_zlabel('z');
        plt.show();
    else:
        print("no se puede graficar");

def main():
    u=np.array([5,5]);
    v=rotacion(u,30);
    dibujar(u,v);
