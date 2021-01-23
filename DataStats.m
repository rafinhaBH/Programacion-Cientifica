function [Mean,Std,Var,Median,Moda,Mediana,Mayor,Menor] = DataStats (Data)
%Function DataStats
%Descripcion:Esta funcion es retorna la media, desviacion y varianza del conjunto de
%datos
Mean= mean(Data);
Std=std(Data);
Var=var(Data);
Median=median(Data);
Moda=mode(Data);
Mayor=0;
Menor=Data(1);
VectorOrganizado=zeros(1,numel(Data));
for i=1:numel(Data)
    for j=1:numel(Data)
        if Data(i)>Data(j)
            VectorOrganizado(i)=Data(i);
        end
    end
end
Mediana=VectorOrganizado(numel(Data)/2);
for i=1:numel(Data)
    if Data(i)>Mayor
        Mayor=Data(i);
    end
end
for i=1:numel(Data)
    if Data(i)<Menor
        Menor=Data(i);
    end
end

    
    
        






%Moda: Valor que mas se repite entre los datos
%Mediana: Valor de la mitad obtenido al organizar los datos, para numero
%impar se puede tomar el promedio de los dos de la mitad
%Llegar a numeros enteros: round(algo)






%el nombre del archivo es el nombre de la funcion en el texto
%Los parametros son las entradas a la funcion para realizar el
%procedimiento, los parametros de salida son los valores producidos por la
%operacion de la funcion

