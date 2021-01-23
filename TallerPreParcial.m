%%Taller parcial 1

fileID=fopen('Parcial-02-P02-214.bin','r');
datos = fread(fileID,'int16');
multiplos7=0;
disp('El numero total de datos es: ');
disp(numel(datos))
for i=1:numel(datos)
    if mod(datos(i),7)==0
        multiplos7=multiplos7+1;
    end
end
disp('el numero de multiplos de 7 es: ')
disp(multiplos7)
mayoresMenores=[];
for i=1:numel(datos)
    if datos(i)>=-3 && datos(i)<=16
        mayoresMenores=[mayoresMenores datos(i)];    
    end
end
disp('La cantidad de valores en [-3,16] es: ')
disp(numel(mayoresMenores))
disp('la mediana de los valores en [-3,16] es: ')
disp(median(mayoresMenores))
minRep=numel(datos);
menosRepetido=datos(1);
for i=1:numel(datos)
    contadorRepeticiones=0;
    for j=1:numel(datos)
        if datos(i)==datos(j)
            contadorRepeticiones=contadorRepeticiones+1;
        end
    end
    if contadorRepeticiones<minRep
        minRep=contadorRepeticiones;
        menosRepetido=datos(i);
    end
    
   
end
disp('El menos repetido es: ')
disp(menosRepetido)


%%%%%Punto 4

file=fopen('Parcial-02-P04-XY-214.bin','r');
datos=fread(file,'float');
x=datos((1:(length(datos)/2)));
y=datos((1+length(datos)/2:length(datos)));
disp(numel(x))
disp(numel(y))
plot(x,y)
