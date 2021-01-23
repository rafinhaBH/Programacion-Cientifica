function matriz = MatrizPasos(num_pasos)
matriz=zeros(num_pasos,3);
limP=10;
limN=-10;
for i=1:num_pasos
    tempx=randi([-1,1]);
    tempy=randi([-1,1]);
    tempz=randi([-1,1]);
    matriz(i,1)=tempx;
    matriz(i,2)=tempy;
    matriz(i,3)=tempz;
    finalx=sum(matriz(:,1));
    finaly=sum(matriz(:,2));
    finalz=sum(matriz(:,3));
    if finalx > limP
        matriz(i,1)=randi([-1,0]);
    else if finalx< limN
            matriz(i,1)=randi([1,0]);
        end
    end
    if finaly > limP
        matriz(i,2)=randi([-1,0]);
    else if finaly< limN
            matriz(i,2)=randi([1,0]);
        end
    end
    if finalz > limP
        matriz(i,3)=randi([-1,0]);
    else if finalz< limN
            matriz(i,3)=randi([1,0]);
        end
    end
end

    
    