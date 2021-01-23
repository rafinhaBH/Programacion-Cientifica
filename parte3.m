histograma=figure('Name','Histograma Años','Color','white'); %Se declara la figura con su nombre y su color de fondo
load('Agno_Nacimiento.mat'); %Se carga el archivo de la parte anterior
anhos=cell2mat(agnos); %Se convierte la cell "agnos" a matriz, para hacer el histograma
figure(histograma); % Se indica que la siguiente figura a editar es el historgrama, que actualmente está en blanco
histogram(anhos); % Se realiza el histograma







