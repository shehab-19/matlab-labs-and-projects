function output=clipping(x,a,b,t) %a is upper clipping limit and b lower clipping 
upper=find( x>a);
x(upper)=a;
lower=find(x<b);
x(lower)=b;
output=x;
figure;
plot(t,output);
grid on ;
title('plot of clipped signal');
end

