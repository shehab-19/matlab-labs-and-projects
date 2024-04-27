disp("Hello and welcome to your personal signal generator I'm ready to help you."); %Welcome Message
frequency=input('Enter the value of the sampling frequency: '); %Inputting the frequency
starting=input('Enter the starting value: '); %Inputting the starting point
ending=input('Enter the ending value: '); %Inputting the ending point
while (starting>=ending) %Warning if the starting point is bigger than or equal to the ending point
    disp('Starting point can not be the same or bigger than the ending point!')
    starting=input('Enter the starting value: '); 
    ending=input('Enter the ending value: ');
end
bp=input('Enter the number of breakpoints: '); %number of the breakpoints
signal_sampling_frequency=frequency*(ending-starting); %calculating the sampling frequency
signal_sampling_time=linspace(starting,ending,signal_sampling_frequency); %calculating the sampling time
time_storing_array=[starting]; %array to store the time range and breakpoints
j=1;  %indicator for the elements in the array
signal=[]; %array to store the signal
  if(bp==0) 
        disp('There is no breakpoints') 
 else 
     while(bp ~= 0)  %loop to enter the breakpoints
    
        break_point_position=input(['Enter the position of the ' iptnum2ordinal(j) ' break point: ']); %entering the breakpoints
        search = searchElement(time_storing_array, break_point_position); %search for the break point in the breakpoints matrix to avoid having the same break point more than once
        if(break_point_position<=starting ||  break_point_position>=ending)  %condition to prevent entering a break point less than or equal to the starting point or bigger than or equal to the ending point
            disp('Invalid Point!')
        elseif (search == 1) %condition to prevent repeated breakpoints
            disp('Repeated point!')
        else  
          time_storing_array(j+1)=break_point_position; %storing the break point in the array
          j=j+1; %go to the next element
          bp=bp-1; %when goes to 0 the loop terminates
         
        end   
     end 
  end
time_storing_array(length(time_storing_array)+1)=ending; %storing the ending point in the array
time_storing_array=sort(time_storing_array); %sorting the array
for i=1:length(time_storing_array)-1 %loop to choose the signal for each region
    region_sampling_frequency=(time_storing_array(i+1)-time_storing_array(i))*frequency; %calculating region sampling frequency
    region_time=linspace(time_storing_array(i),time_storing_array(i+1),region_sampling_frequency); %calculating region time
    signal_choice=input(['Please choose what signal you want for the ' iptnum2ordinal(i) ' Region\n' '1- DC signal\n' '2- Ramp signal\n' '3- General order polynomial\n' '4- Exponential signal\n' '5- Sinusoidal signal\n' '6- Sinc function\n' '7- Triangle pulse\n']); %choosing the signal for each region
    while (signal_choice<1 || signal_choice>7 ) %condition to prevent invalid signal input
        disp('Invalid input !! please enter a number within 1 to 7.  ');
        signal_choice=input(['Please choose what signal you want for the ' iptnum2ordinal(i) ' Region\n' '1- DC signal\n' '2- Ramp signal\n' '3- General order polynomial\n' '4- Exponential signal\n' '5- Sinusoidal signal\n' '6- Sinc function\n' '7- Triangle pulse\n']);
   end
switch signal_choice
    case 1 %DC Signal
     dc_amplitude=input('Enter the DC amplitude: '); %Inputting the amplitude
     dc_signal=DC(dc_amplitude,region_sampling_frequency); %Calling the function
     signal=[signal dc_signal]; %Collecting the signal together
    case 2 %Ramp Signal
    Ramp_slope=input('Enter the Ramp slope: '); %Inputting the slope
    Ramp_intercept=input('Enter the Ramp intercept: '); %Inputting the intercept
    Ramp_signal=Ramp(Ramp_slope,Ramp_intercept,region_time); %Calling the function
    signal=[signal Ramp_signal]; %Collecting the signal together
    case 3 %General polynomial Signal
     polynomial_highest_power=input('Enter the polynomial highest power: '); %Inputting the highest order
     polynomial_intercept=input('Enter the polynomial intercept: '); %Inputting the intercept
     poly_signal= polynomial(polynomial_highest_power,polynomial_intercept,region_time); %Calling the function
     signal=[signal poly_signal]; %Collecting the signal together
    case 4 %Exponential Signal
     exp_amplitude=input('Enter the exp amplitude: '); %Inputting the amplitude
     exp_exponent=input('Enter the exp exponent: '); %Inputting the exponent
     exp_signal= exponential(exp_amplitude,exp_exponent,region_time); %Calling the function
     signal=[signal exp_signal]; %Collecting the signal together
    case 5 %Sinosuidal Signal
    sinosudal_amplitude=input('Enter the amplitude of sinosudal function: '); %Inputting the amplitude
    sinosudal_frequency=input('Enter the frequency of sinosoudal function: '); %Inputting the frequency
    sinosudal_phase=input('Enter the phase of sinosoudal function: '); %Inputting the phase
    sin_signal=sinfunction(sinosudal_amplitude,sinosudal_frequency,sinosudal_phase,region_time); %Calling the function
    signal=[signal sin_signal]; %Collecting the signal together
    case 6 %Sinc Signal
    sinc_amplitude=input('Enter the amplitude of sinc function: '); %Inputting the amplitude
    sinc_center_shift=input('Enter the center shift of sinc function: '); %Inputting the center shift
    sinc_signal =sinc_signall(sinc_amplitude,sinc_center_shift,region_time); %Calling the function
    signal=[signal sinc_signal]; %Collecting the signal together
   case 7 %Traingular Signal
     t_amplitude=input('Enter the amplitude of triangle function: '); %Inputting the amplitude
     t_center_shift=input('Enter the center shift of triangle function: '); %Inputting the center shift
     t_width=input('Enter the width of triangle function: '); %Inputting the width
     t_signal=triangular(t_amplitude,t_center_shift,t_width,region_time); %Calling the function
     signal=[signal t_signal]; %Collecting the signal together
    otherwise %wrong input
      disp('Invalid input!');
end
end
    figure;
    plot(signal_sampling_time,signal); %Plotting the signal
    grid on;
while 1
    signal_operation=input(['Please choose what operation you want\n' '1- Amplitude Scaling\n' '2- Time reversal\n' '3- Time shift\n' '4- Expanding the signal\n' '5- Compressing the signal\n' '6- Clipping the signal\n' '7- The first derivative of the signal\n' '8- None\n' ]); %choosing the operation
    switch signal_operation
        case 1
            %Amplitude Scaling
            amp_scale=input('Enter the amplitude scale value: '); %Inputting the amplitude scale value
            amplitude_scale(signal,amp_scale,signal_sampling_time); %Calling the function
        case 2
            %Time reversal
            time_reverse(signal,signal_sampling_time); %Calling the function
        case 3
            %Time shift
            time_shft=input('Enter the shift value: '); %Inputting the shift value
            time_shift(signal,time_shft,signal_sampling_time); %Calling the function
        case 4 
            %expanding                 
         expanding_value=input('Enter the expanding value: ') ; %Inputting the expanding value
         expanding(signal,expanding_value,starting,ending,frequency); %Calling the function
        case 5
           %compressing the signal 
         compressing_value=input('Enter the compressing value: ') ; %Inputting the compressing value
         compressing(signal,compressing_value,starting,ending,frequency); %Calling the function
         case 6
           %clipping the signal
            upper_limit =input('Enter the upper limit of clipping: ') ; %Inputting the upper limit value
            lower_limit=input('Enter the lower limit of clipping: '); %Inputting the lower limit value
            clipping(signal,upper_limit,lower_limit,signal_sampling_time); %Calling the function
        case 7
         %first derivative operation
           first_derv(signal,signal_sampling_time,frequency); %Calling the function
        case 8 % none % code terminates
         break;
    otherwise %condition in case of incorrect input
        disp('Invalid input!');
    end
end