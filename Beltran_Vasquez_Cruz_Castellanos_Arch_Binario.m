clc
% r1 es un vector de 100 datos co numeros enteros aleatorios entre 1 y
% 100
r1= randi(100,100,1);

%  “v_Rand.bin” es un archivo de tipo binario
fileID=fopen('v_Rand.bin', 'w');

%a r1 se almacena en el archivo binario a partir de la funcion fwrite
fwrite(fileID, [r1]);
%el archivo creado se cierra
fclose(fileID);


%esto es lo que se debe escribir en la ventana de comandos para acceder al 
%archivo solo en modo lectura.
fileID=fopen('v_Rand.bin');
%si se desea que el vector aparezca en la ventana de comandos se debe
%omitir  el ';'

B=fread(fileID, 'int16')
%al final se vuelve a cerrar el archivo
fclose(fileID);