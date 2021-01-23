function valor= MeuCos (x,N)
if N==0
    valor=1;
else
    potencia=x^(2*N);
    valor=potencia*((-1)^N)/(factorial(N)*2)+MeuCos(x,N-1);
end