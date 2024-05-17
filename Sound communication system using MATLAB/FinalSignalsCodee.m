[data,fs]=audioread('sound.m4a');
sound(data,fs);   %to play the sound                %to stop the audio write in commmand window   {clear sound} note that the file will be removed so import it again 
duration=length(data)/fs;   % duration of the signal  

% to plot audio in time domain      

t=linspace(0,duration,length(data));
t_conv= linspace(0,(length(data)/fs)*2,length(data)*2-1);

figure;
plot(t,data);
title('the audio in time domain');

% to plot the sound in frequency domain
f=linspace(-fs/2,fs/2,length(data));
y=fftshift(fft(data));

ymag=abs(y);
%magnitude
figure;
subplot(2,1,1);
plot(f,ymag);
title('frequency domain magnitude');
yphase=angle(y);

subplot(2,1,2);
plot(f,yphase);
title('frequency domain phase');

%  Channel  

sound_length = size(data, 2); 

% Define the channels of impulse responses
h1 = [1 zeros(1, length(data) - 1)];      % Delta function 
h2 = exp(-2 * pi * 5000 * t);             % Exponential decaying with 5000 Hz
h3 = exp(-2 * pi * 1000 * t);             % Exponential decaying with 1000 Hz
h4 = [2 zeros(1,fs-2) 0.5 zeros(1,(length(data)-fs))];  % Delta function 2 and 0.5 at the end

% Initialize matrix to store convolved data
convolved_data=[];
   
figure;
% Convolve each channel of the audio data with the corresponding impulse response
  for j= 1:4
  convolved_data{j}=zeros(length(data)*2-1,sound_length); 
   switch j
       
        case 1
            impulse_response = h1;
            
        case 2
            impulse_response = h2;
             
        case 3
            impulse_response = h3; 
              
        case 4
            impulse_response = h4;
             
   end
  
      for i = 1:sound_length
    % convolution for the current channel
    convolved_data{j}(:, i) = conv(data(:, i), impulse_response');
      end 
    subplot(2, 2,j);
    plot(t, convolved_data{j}(1:length(data),:));  % Plotting the output of each channel
    title(['Signal after Channel ' num2str(j)]);
    
  end


  
sigma= input('Enter the value of sigma:\n');
Z= sigma*randn(1,length(convolved_data{2})); 

Xnoise1=convolved_data{1}+Z';
Xnoise2=convolved_data{2}+Z';
Xnoise3=convolved_data{3}+Z';
Xnoise4=convolved_data{4}+Z';

disp('channel 1 after the noise');
sound(Xnoise1,fs);
pause(length(data)/fs);
disp('channel 2 after the noise');
sound(Xnoise2,fs);
pause(length(data)/fs);
disp('channel 3 after the noise');
sound(Xnoise3,fs);
pause(length(data)/fs);
disp('channel 4 after the noise');
sound(Xnoise4,fs);
pause(length(data)/fs);

% plotting in time domain

figure;
subplot(2,2,1); plot(t,Xnoise1(1:length(data),:)); title('Signal 1 after the noise');
subplot(2,2,2); plot(t,Xnoise2(1:length(data),:)); title('Signal 2 after the noise');
subplot(2,2,3); plot(t,Xnoise3(1:length(data),:)); title('Signal 3 after the noise');
subplot(2,2,4); plot(t,Xnoise4(1:length(data),:)); title('Signal 4 after the noise');

% ploting in frequancy domain

Xnoise1freq=fftshift(fft(Xnoise1));
Xnoise2freq=fftshift(fft(Xnoise2));
Xnoise3freq=fftshift(fft(Xnoise3));
Xnoise4freq=fftshift(fft(Xnoise4));
f=linspace(-fs/2,fs/2,length(Xnoise1freq));

figure;
subplot(2,2,1); plot(f,abs(Xnoise1freq)); title('channel 1 in frequancy domain after the noise');
subplot(2,2,2); plot(f,abs(Xnoise2freq)); title('channel 2 in frequancy domain after the noise');
subplot(2,2,3); plot(f,abs(Xnoise3freq)); title('channel 3 in frequancy domain after the noise');
subplot(2,2,4); plot(f,abs(Xnoise4freq)); title('channel 4 in frequancy domain after the noise');


% receiver 
cutoff_frequency= 3400;

filter=round(length(data)/fs)*((fs/2)-3400);

Xnoise1freq([1:filter length(data)-filter+1:length(data)])=0;
Xnoise2freq([1:filter length(data)-filter+1:length(data)])=0;
Xnoise3freq([1:filter length(data)-filter+1:length(data)])=0;
Xnoise4freq([1:filter length(data)-filter+1:length(data)])=0;




%ploting in time domain

figure;
subplot(2,2,1); plot(t_conv,Xnoise1freq); title('Filtered channel 1 in time domain');
subplot(2,2,2); plot(t_conv,Xnoise2freq); title('Filtered channel 2 in time domain');
subplot(2,2,3); plot(t_conv,Xnoise3freq); title('Filtered channel 3 in time domain');
subplot(2,2,4); plot(t_conv,Xnoise4freq); title('Filtered channel 4 in time domain');

%ploting in frequancy domain

figure;
subplot(2,2,1); plot(f,abs(Xnoise1freq)); title('filtered channel 1 in frequancy domain');
subplot(2,2,2); plot(f,abs(Xnoise2freq)); title('filtered channel 2 in frequancy domain');
subplot(2,2,3); plot(f,abs(Xnoise3freq)); title('filtered channel 3 in frequancy domain');
subplot(2,2,4); plot(f,abs(Xnoise4freq)); title('filtered channel 4 in frequancy domain');

Xnoise1freq= real(ifft(ifftshift(Xnoise1freq)));
Xnoise2freq= real(ifft(ifftshift(Xnoise2freq)));
Xnoise3freq= real(ifft(ifftshift(Xnoise3freq)));
Xnoise4freq= real(ifft(ifftshift(Xnoise4freq)));


% after getting the real part

disp('Filtered signal from channel 1 ...');
sound(Xnoise1freq,fs);
pause(length(Xnoise1freq)/fs);
disp('Filtered signal from channel 2 ...');
sound(Xnoise2freq,fs);
pause(length(Xnoise2freq)/fs);
disp('Filtered signal from channel 3 ...');
sound(Xnoise3freq,fs);
pause(length(Xnoise3freq)/fs);
disp('Filtered signal from channel 4 ...');
sound(Xnoise4freq,fs);

