function [XSol, iter] = MarioNewton(f, xo, fd, TolX, TolF)
X1 = xo;
iter = 0;
while 1  
    iter = iter + 1;
    X2 = X1 - (f(X1)/fd(X1));
    if abs(X2-X1)< TolX
        break;
    end
    if abs(f(X2))< TolF
        break;
    end
    X1=X2
    disp(f(X2));
    
end
XSol = X2;
end


