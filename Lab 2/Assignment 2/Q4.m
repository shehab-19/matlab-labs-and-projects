t=linspace(-40,40,1000);
n=-20:20;

x_of_t=cos(2*t/3);
y_of_t=cos(8*pi*t/38);

x_of_n=cos(2*(2*n)/3);
y_of_n=cos(8*pi*(2*n)/38);

subplot(2, 2, 1);plot(t,y_of_t);
title('y(t)');xlabel('t');ylabel('y');
subplot(2, 2, 2);plot(t,x_of_t);
title('x(t)');xlabel('t');ylabel('x');

subplot(2, 2, 3);stem(n,y_of_n);
title('y[n]');xlabel('n');ylabel('y');
subplot(2, 2, 4);stem(n,x_of_n);
title('x[n]');xlabel('n');ylabel('x');
% x[n] is not periodic


% y[n] is periodic its period = 19 seconds 
% nearly two cycles are in one period