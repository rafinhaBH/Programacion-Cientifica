function [y,t]= rungeKutta4s(f,h,tf,y0)
%Entran como parametro la funcion, el paso h, el final del intervalo, y el
%valor inicial y0
%Salen el vector y con cada solucion, el vector de tiempo total t
t=(0:h:tf);
y=zeros(1,numel(t));
z=zeros(1,numel(t));
y(1)=y0;
for i=1:(numel(t)-1)
    %Ciclo para y
    k1=f(t(i),y(i));
    k2=f(t(i)+h/2,y(i)+h/2*k1);
    k3=f(t(i)+h/2,y(i)+h/2*k2);
    k4=f(t(i)+h,y(i)+h*k3);
    k=(k1+2*k2+2*k3+k4)/6;
    y(i+1)=y(i)+h*k;
end
