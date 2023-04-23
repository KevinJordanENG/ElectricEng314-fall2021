%Lab 1 EE314L
%Plots various functions
t = linspace(0, 2*pi, 25);
y = sin(t);
subplot(2, 1, 1);
plot(t, y);
title('Continuous');
subplot(2, 1, 2);
stem(t, y);
title('Discrete');