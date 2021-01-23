%Para los splines cubicos, las dos primeras derivadas deben ser continuas
%Si tengo n datos, tengo n-1 intervalos, de modo que en cada extremo de los
%intervalos sean iguales en sus derivadas 1 y 2
t=(0:4:20);
y=[0.7 0.9 0.9 0.7 0.3 0];
N=numel(t); %number of data
n=N-1; %Number of subintervals

%Stepsize h:

h=(t(N)-t(1))/n;

Trid=diag(4*ones(1,n-1))+diag(ones(1,n-2),1)+diag(ones(1,n-2),-1);

%for loop

for i=1:n-1
    z(i)=(6/h^2)*(y(i+2)-2*y(i+1)+y(i));
end

z=z';
w=inv(Trid)*z;
sigma=[0;w;0];

for i=i:n
    d(i)=y(i);
    b(i)=sigma(i)/2;
    a(i)=sigma(i+1)-sigma(i)/(6*h);
    c(i)=(y(i+1)-y(i))/h-h/6*(2*sigma(i)+sigma(i+1));
end


