function [output]=first_derv(signal,t,sampling_frequency)
output=(diff(signal))*(sampling_frequency);
time_dev=t(2:end);
figure;
plot(time_dev,output);
grid on;
title('The first derivative of the signal');
end