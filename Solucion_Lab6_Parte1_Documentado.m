% Regresión lineal
FileID=fopen('pobreza.txt','r');v %Declara el fileID del archivo a leer
Valores=textscan(FileID,'%s %s %s'); %Toma los datos y los separa en columnas
fclose(FileID); %Cierra el archivo
for i=2:size(Valores{1},1) %Recorre los valores del conjunto de datos y los convierte en tipo double, debido a que estan en formato string
    X(i-1)=str2double(Valores{2}{i});
    Y(i-1)=str2double(Valores{3}{i});
end

mediaX=mean(X); %Se declaran los valores medios de X y Y y la cantidad de datos
mediaY=mean(Y);
CantidadDatos=length(X);

% Mat*A=B
Mat=[1,mediaX;mediaX,(1/CantidadDatos)*(sum(X.^2))]; %Se declara la matriz con los vectores utilizados para el metodo de minimos cuadrados, con los valores establecidos en la guia de laboratorio, en la estimacion
B=[mediaY;(1/CantidadDatos)*(sum(X.*Y))];
A=inv(Mat)*B;
Y_est_1=A(2)*X+A(1);  %Se encuentra el vector solucion de los coeficientes beta de la regresion

%A1=covarianza(X,Y)/Varianza(X)
covar=cov(X,Y); %Se declara la covarianza de los valores de X y Y
A1=covar(2,1)/covar(1,1);
A0=meanY-mediaX*A1;
Y_est_2=A1*X+A0; %Se realiza la estimacion teniendo en cuanta las covarianzas de la lista de datos

%polyfit
p=polyfit(X,Y,1);  %Se utiliza la funcion polyfit para encontrar los coeficientes beta
Y_poly=polyval(p,X);

%graphics
figure()
subplot(1,3,1);plot(X,Y,'*');
hold on
plot(X,Y_est_1,'b');
title('Forma matricial');
ecuacion=['Y = ' num2str(A(2)) 'X + ' num2str(A(1))];
legend('Data',ecuacion)
ylabel('PovPct');
xlabel('Brth15to17');

subplot(1,3,2);plot(X,Y,'*');
hold on
plot(X,Y_est_2,'r');
title('A1=covarianza(x,y)/variaza(x)');
ecuacion=['Y = ' num2str(A1) 'X + ' num2str(A0)];
legend('Data',ecuacion)
ylabel('PovPct');
xlabel('Brth15to17');

subplot(1,3,3);plot(X,Y,'*');
hold on
plot(X,Y_poly,'g');
title('Polyfit-polyval');
ecuacion=['Y = ' num2str(p(1)) 'X + ' num2str(p(2))];
legend('Data',ecuacion)
ylabel('PovPct');
xlabel('Brth15to17');

fig=gcf;
fig.Units = 'normalized';
fig.OuterPosition = [0 0 1 1];

%R^2
R1=1-((sum((Y-Y_est_1).^2))./(sum((Y-meanY).^2)));
R1_2=1-((sum((Y-Y_est_2).^2))./(sum((Y-meanY).^2)));
R2=corrcoef(X,Y);
R2=R2(1,2)^2;

%Imprimir valores de R^2
fprintf('R2 calculado con la forma matricial: %.3f y R2 con funcion de matlab: %.3f',R1,R2);
fprintf('R2 calculado con la formula de covariaza: %.3f y R2 con funcion de matlab: %.3f',R1_2,R2);
