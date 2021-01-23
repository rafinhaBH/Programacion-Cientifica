function [ solucion, matrizRes ] = Falsa_Posicion( funcion, limites, tolerancia )
    % Falsa_Posicion: Funci�n que calcula la soluci�n de un sistema no lineal
    % usando el m�todo de falsa posici�n
    % Entradas:
    %   funcion - Funci�n no lineal
    %   limites - Vector con las condiciones iniciales de los l�mites a y b
    %   tolerancia - Condici�n de parada 

     x0 = limites(1); % Obtener el x0 inicial 
     x1 = limites(2); % Obtener el x1 inicial 

     fx0 = feval(funcion, x0); % Evaluar la funci�n en x0
     fx1 = feval(funcion, x1); % Evaluar la funci�n en x1

     error = inf;              % Error
     iteracion = 0;            % N�mero de la iteraci�n
     x2Anterior = 0;           % Estimado x2 de la iteraci�n anterior
     matrizRes = zeros(1,4);   % Matriz para guardar los resultados:
                               % 1. N�mero de iteraci�n
                               % 2. x2 Calculado
                               % 3. Funci�n evaluada en x2
                               % 4. Error para la iteraci�n

    while error > tolerancia % Ciclo hasta llegar a la tolerancia deseada 

        x2 = x1-((fx1*(x1-x0))/(fx1-fx0)); % Calcular x2 
        fx2 = feval(funcion,x2);           % Evaluar la funcion en x2

        if(fx0 * fx2 <0)           % Si fx0*fx2<0 la ra�z est� en este rango
            x1 = x2;               % Cambiar el valor del l�mite x1
            fx1 = fx2;             % Cambiar el valor de la funci�n en x1
        else                       % Si fx0*fx2>0 la ra�z est� en el otro rango
            x0 = x2;               % Cambiar el valor del l�mite x0
            fx0 = fx2;             % Cambiar el valor de la funci�n en x0
        end 

        error = abs(x2 - x2Anterior)/x2; % Calcular el error asociado a esta iteraci�n
        x2Anterior = x2;              % Actualizar el valor de cAnterior
        iteracion = iteracion + 1;    % Actualizar el valor de las iteraciones

        matrizRes(iteracion, :) = [iteracion x2 fx2 error]; % Actualizar la matriz de resultados

    end
    solucion = x2; % Guardar la soluci�n en la variable de salida

end

