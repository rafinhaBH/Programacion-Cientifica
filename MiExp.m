function valor= MiExp (x,N)
if N==0
    valor=1;
else
    valor=(x^N)/mifactorial(N)+MiExp(x,N-1);
end

    
    


