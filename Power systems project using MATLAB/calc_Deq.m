function Deq = calc_Deq(sym,N,D)

    if N==2||sym==1
        Deq = D(1);%D(1)=....D(N)
    else
        Deq =(prod(D))^(1/N);
    end
end

  

