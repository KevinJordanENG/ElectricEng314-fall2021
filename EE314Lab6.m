%Lab 6 EE314L
%Kevin Jordan ID# 1301006
%Z-Transform solution finding
%with provided and new code
clear
clc

%Activity 1
%This program computes Z-transform of a function
syms z n %this defines z and n as symbolic variables
ztrans(1/4^n) %calculate z-transform of x[n]

clear
clc

%This program computes the Inverse Z-Transform
syms z n %this defines z and n as symbolic variables
iztrans(2*z/(2*z-1)) %This line computes the inverse z-transform of X(z)

clear
clc

%This program computes the Inverse Z-Transform
syms z n; %defines symbols z and n
iztrans((4*z/(4*z-1)-z^-1+5)/(6-5*z^-1+z^-2)) %computes inverse z-trans

clear
clc

%Arctivity 2
%This program computes the 1st N x[n] vals from X(z)
B = [1 2 1]; %define coeffs of numerator
A = [1 -2 4]; %define coeffs of denominator
N = 5; %number of samples of x[n]
B = [B zeros(1, N-1)]; %initializes vector with zeros for computation
[x, r] = deconv(B, A); %calcs samples
disp(x)

clear
clc

%This program computes the r, p, and k values 
%for the partial fraction expansion
[r, p, k] = residuez([1, 2, 1],[1, -2, 4])

clear
clc

%This program plots the Pole-zero Diagram of a Z-Transform
b = [0 1 1/2]; %define coeffs of numerator
a = [1 3/5 2/25]; %define coeffs of denominator
zplane(b, a)

clear
clc

%Exercises!
%1. Compute the Z-Transform of sin[n]
syms z n; %define symbolic vars
ztrans(sin(n)) %compute Z-Transform

clear
clc

%2. Compute the Inverse Z-Transform of 2z/(z-2)^2
syms z n %define symbolic vars
iztrans((2*z)/(z-2)^2) %compute Inverse Z-Transform

clear
clc

%3. Compute Inverse Z-Transform and plot pole-zero diagram
%Compute transform
syms z n %define symbolic vars for computation
h = iztrans((1+(3*z^-2)+(z^-5))/(1-(z^-3)+(5*z^-4))); %compute Inverse Z-Transform
g = simplify(h);
pretty(g)
%Plot pole-zero diagram
b = [1 0 3 0 0 1]; %define coeffs for numerator
a = [1 0 0 -1 5 0]; %define coeffs for denominator
zplane(b,a)