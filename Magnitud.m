function valor = Magnitud (vector)
suma=0;
for i=1:numel(vector)
    suma=suma+(vector(i)^2);
end
valor=sqrt(suma);
end
