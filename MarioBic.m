function [X2, iter] = MarioBic(FunIn,Int,TolX,TolF)
X0 = Int(1);
X1 = Int(2);
iter = 0;
X2Ant = X1;
while 1
    iter = iter + 1;
    X2 = (X0+X1)/2;
    
    if abs(X2-X2Ant) < TolX
        break;
    end
    if abs(FunIn(X2)) < TolF
        break;
    end
    X2Ant = X2;
    if FunIn(X0)*FunIn(X2) < 0
    X1 = X2;
    else
        X0 = X2;
    end
end

