function [ solucion, matrizRes ] = Biseccion( funcion, limites, tolerancia)
    % Biseccion:  Funci�n que calcula la soluci�n de un sistema no lineal
    % usando el m�todo de bisecci�n
    % Entradas:
    %   funcion - Funci�n no lineal
    %   limites - Vector con las condiciones iniciales de los l�mites a y b
    %   tolerancia - Condici�n de parada 

    a = limites(1);         % L�mite a 
    b = limites(2);         % L�mite b 

    fa = feval(funcion,a);   % Funci�n evaluada en a
    fb = feval(funcion,b);   % Funci�n evaluada en b  

    error = inf;             % Error 
    iteracion = 0;           % N�mero de la iteraci�n
    cAnterior = 0;           % Estimado c de la iteraci�n anterior
    matrizRes = zeros(1,4);  % Matriz para guardar los resultados:
                             % 1. N�mero de iteraci�n
                             % 2. c Calculado
                             % 3. Funci�n evaluada en c
                             % 4. Error para la iteraci�n

    while error > tolerancia % Ciclo hasta llegar a la tolerancia deseada 
%         a1=a;b1=b;
        
        c = (a + b)/2;         % Calcular el c como el punto medio de los l�mites
        fc = feval(funcion,c); % Evaluar la funci�n en c 

        if(fc * fa <0)       % Si fc*fa es menor a cero es porque ah� esta el cruce
            fb = fc;         % Cambiar el l�mite b por c 
            b = c;
        else                 % Si fc*fb es menor a cero es porque ah� esta el cruce  
            fa = fc;         % Cambiar el l�mite a por c
            a = c;
        end

        error = abs(c - cAnterior)/c; % Calcular el error asociado a esta iteraci�n
        cAnterior = c;              % Actualizar el valor de cAnterior 
        iteracion = iteracion + 1;  % Actualizar el valor de las iteraciones

        matrizRes(iteracion, :) = [iteracion c fc error]; % Actualizar la matriz de resultados 
%         matrizRes(iteracion, :) = [iteracion a1 b1 c fc error];
    end

    solucion = c; % Guardar la soluci�n en la variable de salida

end

