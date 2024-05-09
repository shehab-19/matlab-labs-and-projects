% Function to calculate Capacitance per phase
function cph=capacitance_calc(Deq,d)
d=d/100;
    cph=(2*pi*8.85e-12)/log(Deq/(d/2));%Capacitance per phase
    cph=cph*1000;
end
