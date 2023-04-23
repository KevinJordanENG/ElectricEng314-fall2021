%Lab 3 EE314L
%Kevin Jordan ID# 1301006
%Fourier Transform plot generation
%with provided and new code
clear
clc

%Activity 1
%MATLAB code to find Fourier Transform of
%square wave signal x(t)=1 for -2<t<2
figure('Name', 'FT{x(t)=1, -2<t<2}', 'NumberTitle', 'off') %names plot fig window
f = -5:.01:5; %sets the range of the frequency
X = 4*sinc(4*f); %defines the Fourier Transform of square pulse
plot(f, X) %plots the Fourier spectrum

%Plot of the magnitude spectrum
figure('Name', 'Magnitude', 'NumberTitle', 'off') %names plot fig window
plot(f, abs(X)) %plots it

%Plot of the phase spectrum
figure('Name', 'Phase', 'NumberTitle', 'off') %names plot fig window
plot(f, angle(X)) %plots it

%MATLAB code to find Fourier Transform of
%square wave signal x(t)=1 for -2<t<2
figure('Name', 'Integral Computed FT', 'NumberTitle', 'off') %names plot fig window
t = -2:.01:2; %create time value array
k = 0; %initialize loop counter
for f = -5:.01:5 %for length of interval
    k = k+1; %increment for next loo pass
    X(k) = trapz(t, exp(-j*2*pi*f*t)); %calc trap estimate of integral section
end
f = -5:.01:5; %assure right frequency range
plot(f,abs(X)) %plot magnitude

%MATLAB plot of x(t)=cos(2*pi*100*t)+cos(2*pi*500*t)
figure('Name', 'x(t)=cos(2pi*100t)+cos(2pi*500t)', 'NumberTitle', 'off') %names fig
clear; %assures variables are correct values
N = 250; %set sequence length
ts = .0002; %sets sample rate
t = [0:(N-1)]*ts; %calc time range
x = cos(2*pi*100*t)+cos(2*pi*500*t);
plot(t,x) %plots signal

%MATLAB plot of FT{x(t)=cos(2*pi*100*t)+cos(2*pi*500*t)}
figure('Name', 'FT{x(t)=cos(2pi*100t)+cos(2pi*500t)}', 'NumberTitle', 'off') %names fig
k = 0; %initialize loop counter
for f = 0:1:800 %range of frequency plot
    k = k+1; %increment counter
    X(k) = trapz(t, x.*exp(-j*2*pi*f*t)); %calc section of integral estimate
end
f = 0:800; %range of freuency
plot(f, abs(X)) %plot FT

%Activity 2
%MATLAB plot of x(t)=sin(2*pi*200*t)+sin(2*pi*300*t)
figure('Name', 'x(t)=sin(2pi*200t)+sin(2pi*300t)', 'NumberTitle', 'off') %names fig
clear; %assures variables are correct values
N = 250; %set sequence length
ts = .0002; %sets sample rate
t = [0:(N-1)]*ts; %calc time range
x = sin(2*pi*200*t)+sin(2*pi*300*t);
plot(t,x) %plots signal

%MATLAB plot of FT{x(t)=sin(2*pi*200*t)+sin(2*pi*300*t)}
figure('Name', 'FT{x(t)=sin(2pi*200t)+sin(2pi*300t)}', 'NumberTitle', 'off') %names fig
k = 0; %initialize loop counter
for f = 0:1:600 %range of frequency plot
    k = k+1; %increment counter
    X(k) = trapz(t, x.*exp(-j*2*pi*f*t)); %calc section of integral estimate
end
f = 0:600; %range of freuency
plot(f, abs(X)) %plot FT