%Lab 4 EE314L
%Kevin Jordan ID# 1301006
%Discrete Time Fourier Transform plot
%generation with provided and new code
clear
clc

%Activity 1
% The DTFT in loop-form
%create the signal
srate = 1000; %sampling rate
time = 0:1/srate:2; %time vector in seconds
pnts = length(time); % number of time points
signal = 1.5*sin(2*pi*5*time);
%prepare the FT
fourTime = (0:pnts-1)/pnts;
fCoefs = zeros(size(signal));

for fi=1:pnts
    %create complex sine wave
    csw = exp(-1i*2*pi*(fi-1)*fourTime);
    %compute dot product between sine wave and signal
    fCoefs(fi) = sum(signal.*csw)/pnts;
    %these are called the Fourier coefficients
end

%extract amplitudes
ampls = 2*abs(fCoefs);

%compute frequencies vector
hz = linspace(0,srate/2,floor(pnts/2)+1);

figure(1), clf
subplot(211)
plot(time, signal, 'b', 'linew', 2)
xlabel('Time (s)'), ylabel('Amplitude')
title('Time domain')

subplot(212)
stem(hz,ampls(1:length(hz)), 'bs-', 'linew', 3, 'markersize', 15, 'markerfacecolor', 'w')

%make plot look a bit nicer
set(gca, 'xlim', [0 10], 'ylim', [-.01 3])
xlabel('Frequency (Hz)'), ylabel('Amplitude')
title('Frequency domain')

%New signal and use of fft
%The DTFT in loop-form
%create the signal
srate = 1000; %hz
time = 0:1/srate:2; %time vector in seconds
pnts = length(time); %number of time points
signal = 2.5*sin(2*pi*4*time) + 1.5*sin(2*pi*6.5*time);

%prepare the FT
fourTime = (0:pnts-1)/pnts;
fCoefs = zeros(size(signal));

for fi=1:pnts
    %create complex sine wave
    csw = exp(-1i*2*pi*(fi-1)*fourTime);
    %compute dot product between sine wave and signal
    fCoefs(fi) = sum(signal.*csw)/pnts;
    %these are called the Fourier coefficients
end

%extract amplitudes
ampls = 2*abs(fCoefs);

%compute frequencies vector
hz = linspace(0,srate/2,floor(pnts/2)+1);

figure(1), clf
subplot(211)
plot(time, signal, 'b', 'linew', 2)
xlabel('Time (s)'), ylabel('Amplitude')
title('Time domain')

subplot(212)
stem(hz,ampls(1:length(hz)), 'bs-', 'linew', 3, 'markersize', 15, 'markerfacecolor', 'w')

%make plot look a bit nicer
set(gca, 'xlim', [0 10], 'ylim', [-.01 3])
xlabel('Frequency (Hz)'), ylabel('Amplitude')
title('Frequency domain')

%now plot MATLAB's fft output on top
fCoefsF = fft(signal)/pnts;
amplsF = 2*abs(fCoefsF);
hold on
stem(hz,amplsF(1:length(hz)), 'ro', 'markerfacecolor', 'r')

%Activity 2
%DTFT forward and built-in ifft function
%create the signal
srate = 1000; %hz
time = 0:1/srate:2; %time vector in seconds
pnts = length(time); %number of time points
signal = 2.5*sin(2*pi*4*time) + 1.5*sin(2*pi*6.5*time);

%preapre the FT
fourTime = (0:pnts-1)/pnts;
fCoefs = zeros(size(signal));

for fi=1:pnts
    %create complex sine wave
    csw = exp(-1i*2*pi*(fi-1)*fourTime);
    %compute dot product between sine wave and signal
    fCoefs(fi) = sum(signal.*csw)/pnts;
    %these are called the Fourier coefficients
end

%extract amplitudes
ampls = 2*abs(fCoefs);

%compute frequencies vector
hz = linspace(0,srate/2,floor(pnts/2)+1);

figure(1), clf
subplot(311)
plot(time,signal, 'k', 'linew', 2)
xlabel('Time (s)'), ylabel('Amplitude')
title('Time domain')

%plot amplitude
subplot(312)
stem(hz, ampls(1:length(hz)), 'ks-', 'linew',3, 'markersize', 15, 'markerfacecolor', 'w')

%make plot look a bit nicer
set(gca, 'xlim', [0 10], 'ylim', [-.01 3])
xlabel('Frequency (Hz)'), ylabel('Amplitude (a.u.)')
title('Amplitude spectrum')

%plot angles
subplot(313)
stem(hz,angle(fCoefs(1:length(hz))), 'ks-','linew', 3, 'markersize', 15, 'markerfacecolor', 'w')

%make plot look a bit nicer
set(gca, 'xlim', [0 10], 'ylim', [-1 1]*pi)
xlabel('Frequency (Hz)'), ylabel('Phase (rad.)')
title('Phase spectrum')

%finally, plot reconstructed time series on top of original time series
reconTS = real(ifft(fCoefs))*pnts;
subplot(311), hold on
plot(time(1:3:end), reconTS(1:3:end), 'r.')
legend({'Original';'Reconstructed'})

%inspect the two time series. They should be identical!
zoom on

%Exercise!
%1. Create the signal
srate = 1401; %1kHz [first try] 1401Hz > 2*7*10^2 [second try] 
time = 0:1/srate:3; %time vector up to 3 seconds
pnts = length(time); %# of time points
signal = 9*cos(2*pi*4*time)+5*sin(2*pi*7*time);

%compute frequencies vector
hz = linspace(0,srate/2,floor(pnts/2)+1);

%2. Use fft
fCoefs = fft(signal)/pnts;
ampls = 2*abs(fCoefs);

%Plot time
figure(1), clf
subplot(211)
plot(time, signal, 'k', 'linew', 2)
xlabel('Time (s)'), ylabel('Amplitude')
title('Time domain')

%plot amplitude
subplot(212)
stem(hz,ampls(1:length(hz)), 'ks-', 'linew', 3, 'markersize', 15, 'markerfacecolor', 'w')
%make plot look a bit nicer
set(gca, 'xlim', [0 10], 'ylim', [-.01 10])
xlabel('Frequency (Hz)'), ylabel('Amplitude')
title('Frequency domian')

%3. plot reconstructed time series on top of original signal
reconTS = real(ifft(fCoefs))*pnts;
subplot(211), hold on
plot(time(1:3:end),reconTS(1:3:end), 'r.')
legend({'Original';'Reconstructed'})

zoom on