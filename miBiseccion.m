%%MiBiseccion.m

function x2= miBiseccion(FunIn,intIn,tolX,TolF)

x0=intIn(1);
x1=intIn(2);
iter=0;
x2ant=x1;
while 1
    iter=iter+1;
    x2=(x0+x1)/2;
    if abs(x2-x2ant) < tolX
        break;
    end
    if abs(FunIn(x2)) < TolF
        break;
    end
    if (FunIn(X0)*FunIn(x2)) < 0
        x1=x2;
    else
        x0=x2;
    end
end
disp(iter);
