function Grafica(matriz)
totalFilas=numel(matriz(:,1));
coorX=zeros(1,totalFilas);
coorY=zeros(1,totalFilas);
coorZ=zeros(1,totalFilas);
coorX(1)=0;
coorY(1)=0;
coorZ(1)=0;
for i=2:totalFilas
    coorX(i)=matriz(i,1)+coorX(i-1);
    coorY(i)=matriz(i,2)+coorX(i-1);
    coorZ(i)=matriz(i,3)+coorX(i-1);
end
disp(coorX)
disp(coorY)
disp(coorZ)
plot3(coorX,coorY,coorZ,"-o");
