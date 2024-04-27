function output= compressing(signal,a,starting,ending,frequency)
output = downsample(signal,a); %a is the value of compression
x=starting/a;
y=ending/a;
t2=linspace(x,y,(y-x)*frequency);
figure;
plot(t2,output);
grid on ;
title('plot of compressed signal');
end