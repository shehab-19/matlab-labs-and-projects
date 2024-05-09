p=2.65e-08;
l=200;
d=4;
R= resistance_calc(p,l,d);
R
%**********************************
d=3;
sym=0;
D=[1 2 3];
N=3;
Deq=calc_Deq(sym,N,D);
 Lph = inductance_calc(Deq,d);
Lph
%**********************************
Deq=calc_Deq(sym,N,D);
N=3;
sym=0;
D=[1 2 3];
d=4;
Deq=calc_Deq(sym,N,D);
cph=capacitance_calc(Deq,d);
cph
%*************************************
choice=2;
VR_line=220;
A = 9.67e-01 + 1i*8.11e-03;
B = 2.22e+01 + 1i*9.051e+01;
C = -2.95e-06 + 1i*7.16e-04; 
D = 9.67e-01 + 1i*8.11e-03;
 performance(A,B,C,D,VR_line,choice);

