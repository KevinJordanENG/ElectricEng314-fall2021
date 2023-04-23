%Lab 2 EE314L
%Kevin Jordan ID# 1301006
%Plots various functions
clear
clc

%Activity 1:
%get lower/upper limits &exp val before plotting
n1 = input('Lower limit: ');
n2 = input('Upper limit: ');
a = input('Enter nonzero value: ');

%Plots of Sine function
t = linspace(0, 2*pi, 25);
y = sin(t);
figure('Name', 'Sine Function', 'NumberTitle', 'off');
subplot(2, 1, 1);
plot(t, y);
title('Continuous');
subplot(2, 1, 2);
stem(t, y);
title('Discrete');

%Plot of Impulse function
figure('Name', 'Impulse Function', 'NumberTitle', 'off');
t = n1:n2;
Delta = t == 0;
stem(t, Delta);

%Plots of Unit Step function
figure('Name', 'Unit Step Signal', 'NumberTitle', 'off');
Mu = t >= 0;
subplot(2, 1, 1);
stem(t, Mu);
title('Discrete');
subplot(2, 1, 2);
t2 = 0:n2;
Mu2 = t2 >= 0;
plot(t2, Mu2);
title('Continuous');

%Plots of Unit Ramp function
figure('Name', 'Unit Ramp Signal', 'NumberTitle', 'off');
r = t.*[t >= 0];
subplot(2, 1, 1);
plot(t, r);
title('Continuous');
subplot(2, 1, 2);
stem(t, r);
title('Discrete');

%Plots of Unit Exponential function
figure('Name', 'Unit Exponential Signal', 'NumberTitle', 'off');
y = exp(a.*t);
subplot(2, 1, 1);
plot(t, y, 'r');
title('Continuous');
subplot(2, 1, 2);
stem(t, y, 'b');
title('Discrete');

%Activity 2:
%1. Discrete complex exponential
figure('Name', 'f[n] = -3.6e^((-0.5+(j*pi)/4)n)', 'NumberTitle', 'off');
n = 0:82;
f = -3.6*exp((-0.5 + (j*pi)/4).*n);
subplot(2, 1, 1);
stem(n, f, 'r');
hold on
stem(n, imag(f), 'b');
hold off
title('Real (red)/Imaginary (blu) vs n');
subplot(2, 1, 2);
plot(f, imag(f));
title('Real vs Imaginary (n into page)');

%2. Continuous sine
figure('Name', 's(t) = 0.5sin(2*pi*f*t)', 'NumberTitle', 'off');
t = linspace(0,1);
s = 0.5*sin(2*pi*4*t);
plot(t, s);

%3. Commenting the code
figure('Name', 'All-in-One Plot', 'NumberTitle', 'off');
t = (-1:0.01:1)'; %takes a range from -1 to 1 incrementing by 0.01
impulse = t==0; %if t is at 0, impulse has boolean val true (1)
unitstep = t>=0; %for t greater than or equal to 0, bool val (1)
ramp = t.*unitstep; %take t >= 0 value (1) from unitstep and * by t
quad = t.^2.*unitstep; %quadratic t^2 for all t >= 0
plot(t, [impulse, unitstep, ramp, quad]); %plots all 4 functions vs t
