clc
format long g;
FunIn = @(x) 0.009.*cos(x).*(x^3) + log(x) - 3.45;
TolX = 10^-10;
TolF = 10^-10;
IntIn = [10 12.5];
[XSol, IterNum] = MarioBic(FunIn, IntIn, TolX, TolF)
Intento1 = FunIn(XSol)
%% FALSA POSICION
clc
format long g;
FunIn = @(x) 0.009.*cos(x).*(x^3) + log(x) - 3.45;
TolX = 10^-10;
TolF = 10^-10;
IntIn = [10 12.5];
[XSol, IterNum] = MarioFalsaPos(FunIn, IntIn, TolX, TolF)
Intento2 = FunIn(XSol)
%% Punto fijo
clc
clear
close all
%f(x) = 0.003 * cos(x)* x^3 + ln(x) - 3.45
%La idea es que sea g(x)-x = 0 es decir x = g(x)
x2 = 10:0.001:12.5;
FunIn = @(x) 0.009.*cos(x).*(x.^3) + log(x) - 3.45;
g1 = @(x) exp(-0.003.*cos(x).*x.^3+3.45);
g2 = @(x) acos((3.45-log(x))./(0.003.*(x.^3)));
g3 = @(x) ((3.45-log(x))./(0.003.*cos(x))).^(1/3);
g4 = @(x) x-(0.003.*cos(x).*x.^3)-log(x)+3.45;
% figure;
% plot(x2, FunIn(x2), x2, g1(x2));
% figure;
% plot(x2, FunIn(x2), x2, g2(x2));
% figure;
% plot(x2, FunIn(x2), x2, g3(x2));
% figure;
% plot(x2, FunIn(x2), x2, g4(x2));
figure;
plot(x2, g1(x2), x2, x2);
figure;
plot(x2, g2(x2), x2, x2);
figure;
plot(x2, g3(x2), x2, x2);
figure;
plot(x2, g4(x2), x2, x2);
%TEOREMAS DE CONVERGENCIA
% I. PARA UN INTERVALO [X0,X1] SI g(x) hace una correspondencia del intervalo
% inicial para x, al interior del mismo intervalo, entonces existe el menos nn punto
% fijo de g en ese intervalo.
% II. Si g(x) y g'(x) existe para todo X dentro de [x0,x1] y 0<|g'(x)|<1 entonces
% el método converge a la solución.
%% CLASE 17
clc
clear
format long g;
FunIn = @(x) 0.0009.*cos(x).*(x^3) + log(x) - 3.45;
g4 = @(x) x-0.0009.*cos(x).*(x^3)-log(x)+3.45;
TolX = 10^-10;
TolF = 10^-10;
Xin = 11.2;
IntIn = [10 12.5];
[XSol, IterNum] = MarioFalsaPos(FunIn, IntIn, TolX, TolF);
Intento3 = FunIn(XSol);
[Intento4, iter4] = MarioPuntoFijo(FunIn, g4, Xin, TolX, TolF)
FunIn(Intento4)
return;
%% Método de newton
%Método de newton
% Tengo una función F(xo) y de acuerdo al gradiente intento estimar una recta
% y entonces como parámetros de entrada una f(xo), xo y una derivada f(xo) y 
% a través de ello hallo el punto de corte de la recta tangente con el eje x.
%Xi = (xi-1) - f(xi-1)/f'(xi-1);
clc
clear
format long g;
FunIn = @(x) 0.0009.*cos(x).*(x^3) + log(x) - 3.45;
TolX = 10^-10;
TolF = 10^-10;
Xin = 11.2;
fd = @(x) (0.0009).*((3.*cos(x).*(x^2)) - (sin(x).*(x^3))) + (1/x);
[Intento5, iterNew] = MarioNewton(FunIn, Xin, fd, TolX, TolF)
%% Método de la secante
%rsec = (f(xi)-f(xi-1))/xi-(xi-1)
% Xi = Xi-1 - F(xi-1) / rsec
clc
clear
format long g;
FunIn = @(x) 0.009.*cos(x).*(x^3) + log(x) - 3.45;
TolX = 10^-10;
TolF = 10^-10;
IntIn = [11.18 11.2];
[IntentoSec, IterSec] = MarioSecante(FunIn, IntIn, TolX, TolF)
FSec = FunIn(IntentoSec)
%% TASA DE CONVERGENCIA
%Lim cuando i tiende a infinito de |E(i+1)|/|Ei|^r = C
%Ese limite da que |E(i+1)|/|Ei|^r = |E(i)|/|E(i-1)|^r
%Despejo r y me da que 
%ri = ln(|E(i+1)|/|Ei|) / ln(|E(i)|/|E(i-1)|) 