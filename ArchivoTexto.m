%Tipos de archivos: Binario, Texto, .mat
fileID=fopen('MiPrimerArchivoTexto.txt','wt');
var1=100;
var2=300;
fprintf(fileID,'El valor de var1 es: %.d y el valor de var2 es: %.d\n',var1,var2);
while 1 
    line=fget1(fileID);
    if line==1
        break;
    end
    display(line);
end

%.d para dar el valor normal
%.xf para x decimaless