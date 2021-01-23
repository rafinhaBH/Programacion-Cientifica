clear all
close all
clc

to = 1;
yo = 2;
tn = 2;
h = 0.01;

dy = @(t, y) 4*t^2 + y*t^2;
y = @(t) 6*exp(-1/3)*exp((t.^3)/3) - 4;

xin = (to:h:tn);
puntos = length(xin);

yan = y(xin);

yeuf = [];
yeuf(1) = 2;
for i=2:puntos
    yeuf(i) = yeuf(i-1) + h*dy(xin(i-1), yeuf(i-1));
end

yeub = [];
yeub(1) = 2;
for i=2:puntos
    yeub(i) = (yeub(i-1) + 4*h*xin(i)^2)/(1-h*xin(i)^2);
end

yeum = [];
yeum(1) = 2;
for i=2:puntos
    yeum(i) = (yeum(i-1) + (h/2)*(xin(i-1)^2*yeum(i-1) + 4*xin(i-1)^2 + 4*xin(i)^2))/(1-(h/2)*xin(i)^2);
end

yrk2 = [];
yrk2(1) = 2;
for i=2:puntos
    yrk2(i) = yrk2(i-1) + (h/2)*(dy(xin(i-1), yrk2(i-1)) + dy((xin(i-1)+h), yrk2(i-1)) + h*dy(xin(i-1), yrk2(i-1)));
end

yrk4 = [];
yrk4(1) = 2;
for i=2:puntos
    yrk4(i) = yrk4(i-1) + (h/6)*(dy(xin(i-1), yrk4(i-1)) + 2*(dy(xin(i-1) + 0.5*h, yrk4(i-1) + 0.5*h*dy(xin(i-1), yrk4(i-1)))) + 2*(dy(xin(i-1) + 0.5*h, yrk4(i-1) + 0.5*h*(dy(xin(i-1) + 0.5*h, yrk4(i-1) + 0.5*h*dy(xin(i-1), yrk4(i-1))))) + dy(xin(i-1) + h, yrk4(i-1) + h*(dy(xin(i-1) + 0.5*h, yrk4(i-1) + 0.5*h*(dy(xin(i-1) + 0.5*h, yrk4(i-1) + 0.5*h*dy(xin(i-1), yrk4(i-1)))))))));
end
    
    
figure 
plot(xin, yan, 'k')
figure
plot(xin, yeuf, 'y')
hold on
plot(xin, yeub)
hold on
plot(xin, yeum, 'r')
hold on
plot(xin, yrk2, 'g')
hold on
plot(xin, yrk4, 'm')