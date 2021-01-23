function  Solucion = MiGauss(A, B)
% Crear la matriz aumentada
n = size(A,1);
m = size(B,2);
matrizAumentada = zeros(n,n+m);
for i=1:n
   for j=1:n+m
       if(j>n)
          matrizAumentada(i,j) = B(i,j-n);
       else
          matrizAumentada(i,j) = A(i,j);
       end
   end
end

for j=1:n
   pivote = matrizAumentada(j,j);
   for i=j+1:n
      matrizAumentada(i,:) = matrizAumentada(i,:)-(matrizAumentada(j,:)/pivote*matrizAumentada(i,j));
   end
end
Solucion = zeros(n,m);
for k=1:m
    for i=n:-1:1
        sumatoria = 0;
        for j=i+1:n
            sumatoria = sumatoria + (matrizAumentada(i,j)*Solucion(j,k));
        end
        Solucion(i,k) = (matrizAumentada(i,n+k)-sumatoria)/matrizAumentada(i,i);
    end
end