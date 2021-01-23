function valor = SerieTaylor (x,n)
suma=0;
for i=1:n
    parcial=(-1)*(x^i)/i;
    suma=suma+parcial;
end
valor=suma;
    
    
    