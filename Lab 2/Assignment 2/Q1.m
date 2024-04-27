a= 4*ones(1,200);
t1= linspace(0,1,100);
b= cos(2*pi*t1/4)+3;
c= 3*ones(1,200);
t2= linspace(-2,3,500);
d= [a b c];
figure;
plot(t2,d,'lineWidth',1);
axis([-2 3 0 6], 'square'); grid on;
