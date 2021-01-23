function XSol = MyNewton(f, xo, fd)
m = fd(xo);
b = -m.*xo + f(xo);
tan = @(x) m.*x + b;
xc = -b/m;
end

