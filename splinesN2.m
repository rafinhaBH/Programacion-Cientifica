function y = splinesN2(puntos, x)
% Función que recibe una matriz nx2 de puntos (x, y) y un vector de valores
% de x para los que se quiere realizar la interpolación por splines
% cúbicos.
% Nicolás Cruz-201813270

n = size(puntos, 1) - 1; % Se determina el número de intervalos
A = zeros(4*n); % Se crea la matriz A que hará parte del sistema Ax = b
b = zeros(4*n,1); % Se crea el vector b que hará parte del sistema Ax = b
y = zeros(length(x), 1); % Se crea el vector de salida que tendrá los valores de la interpolación de los puntos x que entraron

%% En este doble ciclo se rellenarán las primeras 2n filas de la matriz A, que corresponden a las ecuaciones obtenidas por la primera condición.
ind = 1; % Se crea un índice para cada punto
c = 1; % Se crea una constante que indicará el intervalo actual

for i=1:2*n % Ciclo que recorre las filas
    for j=c:(c+3) % Ciclo que recorre las columnas en grupos de a 4, que corresponden a los 4 coeficientes de cada intervalo
        A(i,j) = puntos(ind, 1)^(c+3-j); % Se rellena la matriz A con los valores de x elevados al exponente correspondiente
    end
    b(i) = puntos(ind, 2); % Se rellena el vector b con los valores de y correspondientes
    if mod(i, 2) % Condicional que actualiza el índice del punto y el intervalo actual
        ind = ind + 1; % Siguiente punto cuando corresponde
    else
        c = c + 4; % La constante se modifica al inicio del intervalo siguiente
    end
end
%% En este doble ciclo se rellenarán las filas de la matriz A desde la 2n+1 hasta la 3n-1, que corresponden a las ecuaciones obtenidas por la segunda condición.
ind = 2; % Indice, inicia en 2 porque esta condición evalúa los puntos que son comunes entre intervalos adyacentes
c = 1; % Constante de intervalo

for u=i+1:i+n-1 % Ciclo que recorre las filas
    for j=c:c+7 % Ciclo que recorre las columnas en grupos de a 8, que corresponden a los pares de intervalos que se igualan.
        if mod(j, 4) == 0 % Condicional que ignora la posición 4 de cada intervalo puesto que al derivar las ecuaciones esta siempre es 0
            continue
        elseif mod(j-c, 8)-4 < 0 % Intervalo que suma
            A(u, j) = (4-mod(j, 4))*puntos(ind, 1)^(3-mod(j, 4));
        else % Intervalo que resta
                A(u, j) = -(4-mod(j, 4))*puntos(ind, 1)^(3-mod(j, 4));
        end
    end
    ind = ind + 1; % Actualiza el indice
    c = c + 4; % Actualiza la constante
end
%% En este doble ciclo se rellenarán las filas de la matriz A desde la 3n hasta la 4n-2, que corresponden a las ecuaciones obtenidas por la tercera condición.
ind = 2; % Indice, inicia en 2 porque esta condición evalúa los puntos que son comunes entre intervalos adyacentes
c = 1; % Constante de intervalo
for q=(u+1):(u+n-1) % Ciclo que recorre las filas
    for j=c:c+7 % Ciclo que recorre las columnas en grupos de a 8, que corresponden a los pares de intervalos que se igualan.
        if mod(j, 4) == 0 || mod(j, 4) == 3 % Condicional que ignora las posiciones 3 y 4 de cada intervalo puesto que al derivar 2 veces las ecuaciones estas siempre son 0
            continue
        elseif mod(j-c, 8)-4 < 0 % Intervalo que suma
            A(q, j) = (10-2^(mod(j, 4)+1))*puntos(ind, 1)^(2-mod(j, 4));
        else % Intervalo que resta
            A(q, j) = -(10-2^(mod(j, 4)+1))*puntos(ind, 1)^(2-mod(j, 4));
        end
    end
    ind = ind + 1; % Actualiza el indice
    c = c + 4; % Actualiza la constante
end
%% En este doble ciclo se rellenarán las filas de la matriz A desde la 4n-1 hasta la 4n, que corresponden a las ecuaciones obtenidas por la cuarta condición (p"(1940)=p�?(2010)=0).
% ind = 1; % Indice, que inicia en 1 porque se evaluará el primer y último punto
% c = 1; % Constante de intervalo
% for g=q+1:q+2  % Ciclo que recorre las filas
%     for j=c:c+1 % Ciclo que recorre las columnas en grupos de a 2, que corresponden a las primeras 2 posiciones de los intervalos a evaluar, ya que al derivar 2 veces las ecuaciones, las otras 2 posiciones siempre son 0
%         A(g, j) = (10-2^(mod(j, 4)+1))*puntos(ind, 1)^(2-mod(j, 4));
%     end
%     ind = size(puntos, 1); % Actualización del índice, que pasa a ser el del pultimo punto
%     c = 4*(n-1)+1; % Actualización del intervalo, que pasa a ser el último
% end
ind = 1; % Indice, que inicia en 1 porque se evaluará el primer y último punto
c = 1; % Constante de intervalo
for g=q+1:q+2  % Ciclo que recorre las filas
    for j=c:c+1 % Ciclo que recorre las columnas en grupos de a 2, que corresponden a las primeras 2 posiciones de los intervalos a evaluar, ya que al derivar 2 veces las ecuaciones, las otras 2 posiciones siempre son 0
            A(g, j) = (10-2^(mod(j, 4)+1))*puntos(ind, 1)^(1-(j-c));
    end
    ind = size(puntos, 1); % Actualización del índice, que pasa a ser el del pultimo punto
    c = 4*(n-1)+1; % Actualización del intervalo, que pasa a ser el último
end
%% Se resuelve el sistema Ax = b. Esta operación produce siempre un error: Matrix is close to singular or badly scaled. Results may be inaccurate. RCOND = (número cercano a 0). Esto hace que el resultado sea impreciso, según investigué, pero no supe que hacer para solucionarlo.
% Esto al parecer no es porque el método esté mal planteado, sino que la
% forma con la que queda la matriz A en este problema hace que al hacer la operación A\b
% la precisión sea muy baja.
C = A\b; % LEER SECCION
%% Según los resultados de los coeficientes, se hayan los valores de salida de Y para los nuevos x ingresados
for i=1:length(x)
    for j=1:length(puntos)
        if x(i) >= puntos(j, 1)
            t = j;
        else
            break
        end
    end
%     c = 1;
%     while c+1 >= length(puntos) % Esta parte sólo es para identificar el intervalo en que se ubica el x solicitado
%         if x(i) > puntos(c+1, 1)
%             c = c + 1;
%         else 
%             break
%         end
%     end
    if t == 1
        t = t + 1;
    end
    o = 1 + (t-2)*4;
    for j=o:o+3 % Aquí si se haya el valor de y
        if mod(j, 4) == 0
            y(i) = y(i) + C(j);
        else
            y(i) = y(i) + C(j)*(x(i)^(4-mod(j, 4)));
        end
    end
end
end