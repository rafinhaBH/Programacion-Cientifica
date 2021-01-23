function [y] = interlag(x,y,v)
n=numel(x); %Valor del numero de datos
suma=0; %Contador de la suma final empezado en 0
for i=1:n %For que acumula la multiplicatoria
    pt=1;
    for j=1:n %For que 
        if j~=i
            pt=pt*(v-x(j))/(x(i)-x(j));
        end
    end
    suma=suma+y(i)*pt;
end
y=suma;