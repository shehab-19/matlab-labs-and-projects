function [output]=amplitude_scale(signal,amp,t)
output=amp*signal;
figure;
plot(t,output);
grid on ;
title('plot of scaled signal');
end