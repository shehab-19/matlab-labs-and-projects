function [output]= expanding(signall,value,startingg,endingg,frequenccy)
output=resample(signall,value,1); 
x=startingg*value;
y=endingg*value;

t2=linspace(x,y,(y-x)*frequenccy);
figure;
plot(t2,output);
grid on ;
title('plot of expanding');

end

