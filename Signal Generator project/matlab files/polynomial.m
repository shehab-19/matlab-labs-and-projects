function power_signal = polynomial(power,intercept,t)
power_signal=0;
    for i=power:-1:1
      coeff=input(['Enter the coeffecient of the ' iptnum2ordinal(i) ' power: ']);
      power_signal=coeff*t.^i+power_signal;
    end
    power_signal=power_signal+intercept;
    %figure;
    %plot(t,power_signal);
end