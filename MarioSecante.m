function [X2, iter] = MarioSecante(FunIn,Int,TolX,TolF)
X0 = Int(1);
X1 = Int(2);
iter = 0;
X2Ant = X1;
while 1
    iter = iter + 1;
    X2 = X1 - ((FunIn(X1)*(X1-X0))/(FunIn(X1)-FunIn(X0)));
    
    if abs(X2-X1) < TolX
        break;
    end
    if abs(FunIn(X2)) < TolF
        break;
    end
    X0 = X1;
    X1 = X2;
    
end
