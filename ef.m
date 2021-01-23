function [y] = ef(f,h,tf,y0)
t=(0:h:tf);
y=zeros(1,numel(t));
y(1)=y0;
for i=1:(numel(t)-1)
    k=feval(f,t(i),y(i));
    y(i+1)=y(i)+h*k;
end
