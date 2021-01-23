clear 
clc
%Carga del archivo .mat 
lista = matfile('Lista.mat'); 
%Carga de la informacion contenida en la variable data
datos = lista.data;
%Obtencion de los datos numericos de la columna de año de nacimiento
agnos = datos(2:101, 6);
%Guardado del archivo nuevo con la columna de años
save('Agno_Nacimiento','agnos');
%Creacion del objeto .mat para que contenga la informacion
archivo = matfile('Agno_Nacimiento','Writable',true);
%Carga de la informacion en el objeto
archivo.agnos = agnos;