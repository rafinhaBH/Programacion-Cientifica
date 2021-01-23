function Xsol = MiGaussJordan (A,b)
N=size(A,1); %1 me da las filas y 2 me da las columnas
M=size(b,2);
Aau=zeros(N,M);
% Hacer la matriz aumentada
for i=1:N
    for j=1:(N+M)
        if j<=N
            Aau(i,j)=A(i,j);
        else 
            Aau(i,j)=b(i,j-N);
        end
    end
end
disp ('Esta es la matriz aumentada');
disp (Aau);
% Iterar por filas
% i. Convertir en 0 los elementos de abajo de la misma columna del pivote,
% para esto iterar por filas desde la siguiente posicion de pivote hasta el
% numero total de filas

for j=1:N % Cada fila
    for i=(j+1):N % La fila siguiente
        Aau(i,:)= Aau(i,:)-Aau(j,:)*((Aau(i,j)/Aau(j,j)));
    end
end
for j=1:N % Deja todos los pivotes en 1
    Aau(j,:)= Aau(j,:)/Aau(j,j);
end
for j=1:(N) %Dejar la matriz triangular
    for d=1:N
        if d~=j
        Aau(d,:)=Aau(d,:)-(Aau(j, :)*Aau(d,j));
        end
    end
end
disp(Aau)
for i=1:N
    for j=1:M
        Xsol(i,j)=Aau(i,j+N);
    end
end
