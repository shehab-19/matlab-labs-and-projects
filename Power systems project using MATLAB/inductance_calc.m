% Function to calculate inductance per phase
function Lph = inductance_calc(Deq,d)
d=d/100;
    Lph = 2e-7*log(Deq/(0.7788*(d/2))); % Inductance per phase
    Lph=Lph*1000;
end
