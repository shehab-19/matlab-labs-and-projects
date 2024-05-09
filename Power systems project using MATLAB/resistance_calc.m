% Function to calculate resistance 
function Resistance = resistance_calc(p,l,d)
d=d/100;
l=l*1000;
    %(p: resistivity,l:length ,d:Diameter) of conductor 
    A = pi*(d/2)^2; % Cross-sectional area of the conductor
    Resistance=p*l/A; %DC resistance
   
    R_AC=1.1*Resistance;
end
