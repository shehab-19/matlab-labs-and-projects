%a
n=0:25;
x1=0;
for m=0:10
  delta1=(n==(2*m))*1;
  delta2=(n==(2*m+1))*1;
  x1=x1+(m+1).*(delta1-delta2);
end 
subplot(2,2,1);stem(n,x1);
title('x1[n]');xlabel('n');
%b
n=-10:10;
x2_2=(n==0)*10;
u_1=heaviside(n+5);
u_1(n==-5)=1;
u_2=heaviside(n-6);
u_2(n==6)=1;
u_3=heaviside(n-4);
u_3(n==4)=1;
u_4=heaviside(n-10);
u_4(n==10)=1;
x2= (n.^2).*(u_1-u_2)+10.*x2_2+20.*(0.5.^n).*(u_3-u_4);
subplot(2,2,2);stem(n,x2);
title('x2[n]');xlabel('n');
%c
n= 0:20;
x3= (0.9.^n).*cos(0.2*pi*n+(pi/3));
subplot(2,2,3);stem(n,x3);
title('x3[n]');xlabel('n');
%d
n=0:19;
i=[1,2,3,4];
x4=[i i i i i];
subplot(2,2,4);stem(n,x4);
title('x4[n]');xlabel('n');