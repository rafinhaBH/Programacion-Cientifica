function [ solucion, matrizRes ] = Punto_Fijo( funciong, x0, tolerancia )
    % Punto_Fijo: Funci�n que calcula la soluci�n de un sistema no lineal
    % usando el m�todo de punto fijo
    % Entradas:
    %   funcion - Funci�n no lineal f(x)
    %   funciong - Funci�n g(x)
    %   x0 - Condici�n inicial de x0
    %   tolerancia - Condici�n de parada

    error = inf;             % Error
    iteracion = 0;           % N�mero de la iteraci�n
    matrizRes = zeros(1,4);  % Matriz para guardar los resultados:
                             % 1. N�mero de iteraci�n
                             % 2. x1 Calculado
                             % 3. Funci�n g evaluada en x0
                             % 4. Error para la iteraci�n

    while error > tolerancia % Ciclo hasta llegar a la tolerancia deseada
        gx0 = feval(funciong,x0);   % Evaluar la funcion g en x0
        x1 = gx0;                   % Actualizar el valor de x0

        error = abs(x1 - x0)/x1;       % Calcular el error asociado a esta iteraci�n
        x0 = x1;                    % Actualizar el valor de x0
        iteracion = iteracion + 1;  % Actualizar el valor de las iteraciones
        matrizRes(iteracion, :) = [iteracion x1 gx0 error]; % Actualizar la matriz de resultados
    end

    solucion = x1; % Guardar la soluci�n en la variable de salida

end

