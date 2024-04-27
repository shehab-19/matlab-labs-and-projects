function [output]=time_reverse(signal,t)
output=signal;
time_rev=-t;
figure;
plot(time_rev,output);
grid on;
title('Plot of time-reversed signal');
end