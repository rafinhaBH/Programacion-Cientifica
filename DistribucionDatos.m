%Distribucion de datos

Datos= round(rand(1,100)*100);
[Mean,Std,Var,Moda,Mediana,Mayor,Menor]= DataStats(Datos);
disp([Mean,Std,Var,Moda,Mediana,Mayor,Menor])
%No tienen que coincidir con los argumentos de la funcion en el archivo funcion
