%%Sistemas a solucionar

%Sistema 1

A= [1 3 4;2 7 3;2 8 6];
a=[3;.7;-4];

Solucion1a=MiGauss(A,a)
Solucion1b=MiGaussJordan(A,a)

%Sistema 2

B=[2 8 -4;2 11 5;4 18 3];
b=[0;9;11];

Solucion2a=MiGauss(B,b)
Solucion2b=MiGaussJordan(B,b)

%Sistema 3

C=[0 2 6;3 9 4;1 3 5];
c=[2;7;6];

Solucion3a=MiGauss(C,c)
Solucion3b=MiGaussJordan(C,c)

%Sistema 4

D=[1 3 2 5;-1 2 -2 5;2 6 4 7;0 5 2 6];
d=[11;-6;19;5];

Solucion4a=MiGauss(D,d)
Solucion4b=MiGaussJordan(D,d)


