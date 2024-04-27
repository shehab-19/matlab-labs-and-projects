function [output]=sinc_signall(amplitude,shift,t)
P=round(((t(1)+t(end))/2)+shift);
output=amplitude*sinc(t-P);
end