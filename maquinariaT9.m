format long % mayor precision de decimales
tf=100; %simular para 100 segundos
wi=0; % la velocidad angular inicial es cero
h=0.5; % Paso para el metodo de RK4
% Ecuacion diferencial de la forma y'=f(x,y(x))
f= @(t,y) 0.85037-0.0868*y^2;
tempo=0:h:tf; %Vector tiempo que se va a usar para graficar despues
velang=rungeKutta4(f,h,tf,wi); %Creacion del vector de velocidad angular
angulo=cumtrapz(velang,tempo);

%Ahora comparar con el metodo de euler

veuler=ef(f,h,tf,wi); %Velocidad con el metodo de euler


%Grafica

figure(1)
plot(tempo,velang,'r*');
hold on
plot(tempo,veuler,'go');
legend('Metodo RK4','Metodo Euler')
title('Respuesta en el tiempo de la velocidad angular')
xlabel('Tiempo [s]')
ylabel('Velocidad angular [rad/s]')


