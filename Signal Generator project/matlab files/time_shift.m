function [output]=time_shift(signal,shift,t)
output=signal;
time_shft=t-shift;
figure;
plot(time_shft,output);
grid on;
title('Plot of time-shifted signal');
end