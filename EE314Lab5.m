%Lab 5 EE314L
%Kevin Jordan ID# 1301006
%Laplace Transform solution finding
%with provided and new code
clear
clc

%Activity 1
%This program computes Laplace transform of a function
syms x t    %this defines x and t as symbolic variables
x=t;        %define x(t) = t
laplace(x)  %calculate Laplace transform of x(t)

clear
clc

syms f t s  %this defines f, t, and s as symbolic variables 
f = -1.25+3.5*t*exp(-2*t)+1.25*exp(-2*t); %this line defines the function f
F = laplace(f,t,s); %this line computes the Laplace of f
G = simplify(F); %this line simplifies the Laplace of f
pretty(G) %this line prints the Laplace of f

clear
clc

syms f t s  %this defines f, t, and s as symbolic variables 
f = 5*exp(-2*t); %this line defines the function f
F = laplace(f,t,s); %this line computes the Laplace of f
G = simplify(F); %this line simplifies the Laplace of f
pretty(G) %this line prints the Laplace of f

%Activity 2
%Inverse Laplace Transform with MATLAB
clear
clc

syms F s; %defines the symbols
F = (s-5)/(s*(s+2)^2); %defines the function
f = ilaplace(F); %compute the Inverse Laplace of F
simplify(f);
pretty(f)

clear
clc

syms F s; %defines the symbols
F = (10*(s+2))/(s*(s^2+4*s+5)); %defines the function
f = ilaplace(F); %compute the Inverse Laplace of F
simplify(f);
pretty(f)

clear
clc

%Exercise signal 1
syms F s; %defines the symbols
F = 24/(s*(s+8)); %defines the function
f = ilaplace(F); %compute the Inverse Laplace of F
simplify(f);
pretty(f)

clear
clc

%Exercise signal 2
syms Y s; %defines the symbols
Y = 1/s - 2/(s+4) + 1/(s+5); %defines the function
y = ilaplace(Y); %compute the Inverse Laplace of F
simplify(y);
pretty(y)

clear
clc

%Exercise 3 laplace of derivative and function itself
syms f t s; %defines the symbols
f = 5*exp(-2*t); %this line defines the function f
F = laplace(f,t,s); %this line computes the Laplace of f
G = simplify(F); %this line simplifies the Laplace of f
fprintf('Here is the Laplace of the function itself\n');
pretty(G)

fprintf('\n');

syms h t s; %defines the symbols
h = diff(f, t); %this line defines the function h
H = laplace(h,t,s); %this line computes the Laplace of h
K = simplify(H); %this line simplifies the Laplace of h
fprintf('Here is the Laplace of the derivative of the function\n');
pretty(K)

fprintf('\n');
fprintf('Clearly, the Laplace of the derivative is expressed in terms\n');
fprintf('of the function itself, in this case by a factor of -2\n');

%This additional section is for finding solutions to diff eqs
%with initial conditions
clc; clearvars; syms  t s Y y(t) Dy(t)
%assume([t Y] > 0);
Dy = diff(y, t);
D2y = diff(Dy, t);
LS = 1;
EQN=2*D2y+6*Dy+4*y-LS; % Diff. Equation formulation
LEQN=laplace(EQN,t,s); % Laplace transform of the Diff. Equation
LT_Y=subs(LEQN,laplace(y,t,s),Y); % Substitute ICs and initiate the arbitrary unknown "Y"
LT_Y=subs(LT_Y, y(0), 0);         %  y(0) = 0
LT_Y=subs(LT_Y, subs(diff(y(t), t), t, 0), -1);  %  dy(0)= -1
ys=solve(LT_Y,Y); % Solve for the arbitrary unknown: Y
y=ilaplace(ys,s,t); % Inverse of the Laplace Transform:
simplify(y);
pretty(y)