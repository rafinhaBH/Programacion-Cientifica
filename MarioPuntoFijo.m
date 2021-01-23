function [XSol, iter] = MarioPuntoFijo(F,G,Xin,TolX,TolF)
X1 = Xin;
iter = 0;
while 1  
    iter = iter + 1;
    X2 = G(X1);
    if abs(X2-X1)< TolX
        break;
    end
    if abs(F(X2))< TolF
        break;
    end
    X1=X2;
end
XSol = X2;
end

