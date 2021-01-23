prompt='Deme el numero para calcular el seno ';
%Para mayor presicion en el comand window "format long g"
x=input(prompt);
n=2:1:20;
v=zeros(1,numel(n));
errores=zeros(numel(n),1);
for i=1:numel(n)
    v(i)=MiSin(x,i);pi
    errores(i)=abs(v(i)-sin(x));
end
figure; %No reeemplaza la que ya tengo
plot(n,errores);

    