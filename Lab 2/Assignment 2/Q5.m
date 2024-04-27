x = [1,-2,4,6,-5,8,10];
a = 5;b = 7;
x_pad = [zeros(1,a) x zeros(1,b)];
x_pad_in = (1:length(x_pad)) - (a+5);

x_plus_2 = [zeros(1,a-2) x zeros(1,b+2)];
x_minus_4 = [zeros(1,a+4) x zeros(1,b-4)];
x1= 3*x_plus_2+x_minus_4+2*x_pad;
figure;
stem(x_pad_in,x1);
title('x1');

x_plus_4 = [zeros(1,a-4) x zeros(1,b+4)];
x_minus_1 = [zeros(1,a+1) x zeros(1,b-1)];
x_reverse = [zeros(1,a+2) fliplr(x) zeros(1,b-2)];
x_reverse_2 = [zeros(1,a+4) fliplr(x) zeros(1,b-4)];
x2 = (x_plus_4 .* x_minus_1) ...
+ (x_reverse_2 .* x_pad);
figure;
stem(x_pad_in,x2);
title('x2');

x3 = 0;
for k=1:5
    x_of_k = [zeros(1,a+k) x zeros(1,b-k)];
    x3 = x3 + x_pad_in .* x_of_k;
end
figure;
stem(x_pad_in,x3);title('x3');