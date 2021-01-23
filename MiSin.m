%Recursión:
% 1. Hacer una funcion recursiva que calcule sen(x) a partir de su serie de
%taylor a partir de sus parametros de entrada x,N
%Error absoluto = |Xe-Xt| Error relativo |Xe-Xt|/|Xt|
% 2. Estimar sinx con la funcion implementando para diferentes valores de N
% N=10:5:100
% Graficar el error absoluto en funcion de N

function [valor] = MiSin (x,N)
if N==0
    valor=x;
else
    potencia=x^((2*N+1));
    valor=potencia*((-1)^N)/(factorial((N)*2+1))+MiSin(x,N-1);
end


