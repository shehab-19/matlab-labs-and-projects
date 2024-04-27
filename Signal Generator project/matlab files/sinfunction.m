function [output]= sinfunction(amplitude,frequency,phase,t)

   output= amplitude * sin(2*pi*frequency*t+phase);
 
end