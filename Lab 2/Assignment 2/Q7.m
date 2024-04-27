n= 0:50;
w= randn(1,51);
x1= cos(0.04*pi*n)+0.01*w;
x2= cos(0.04*pi*n)+0.2*w;
x3= cos(0.04*pi*n)+2*w;
figure;
stem(n,x1);
title('0.01');
figure;
stem(n,x2);
title('0.2');
figure;
stem(n,x3);
title('2');