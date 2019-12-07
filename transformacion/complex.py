import math
import matplotlib.pyplot as plt
import numpy as np

class Complex(object):
    def __init__(self, real, imag=0.0):
        self.real = real
        self.imag = imag

    def __add__(self, other):
        return Complex(self.real + other.real,
                       self.imag + other.imag)

    def __sub__(self, other):
        return Complex(self.real - other.real,
                       self.imag - other.imag)

    def __mul__(self, other):
        return Complex(self.real*other.real - self.imag*other.imag,
                       self.imag*other.real + self.real*other.imag)

    def __div__(self, other):
        sr, si = self.real, self.imag
        zr, zi = other.real, other.imag # short forms
        r = float(zr**2 + zi**2)
        return Complex((sr*zr+si*zi)/r, (si*zr-sr*zi)/r)

    def __abs__(self):
        return sqrt(self.real**2 + self.imag**2)

    def __neg__(self):   # defines -c (c is Complex)
        return Complex(-self.real, -self.imag)

    def __eq__(self, other):
        return self.real == other.real and self.imag == other.imag

    def __ne__(self, other):
        return not self.__eq__(other)

    def __str__(self):
        return '(%g, %g)' % (self.real, self.imag)

    def __repr__(self):
        return 'Complex' + str(self)

    def __pow__(self, power):
        raise NotImplementedError('self**power is not yet impl. for Complex')

    def rotar(self,angulo):
        alfa=math.radians(angulo)
        E=Complex(math.cos(alfa),math.sin(alfa));
        return E*self;


def dibujar2D(u,v):
    x=np.array([u.real,v.real]);
    y=np.array([u.imag,v.imag]);
    origin=[0],[0];
    plt.quiver(*origin,x,y,color=['r','b'],scale=10);
    plt.xlim(-5,5);
    plt.ylim(-5,5);
    plt.grid(b=True, which='major');
    plt.show();

def main():
    u=Complex(-math.sqrt(3),3);
    v=u.rotar(90);
    print(u);
    print(v);
    dibujar2D(u,v);
