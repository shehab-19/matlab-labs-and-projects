function [output]= triangular(amplitude,center_shift,width,t)

   output= amplitude * ((1-(1/(width/2))*abs(t-center_shift)).*(abs(t-center_shift)<=(width/2)));
 
end
