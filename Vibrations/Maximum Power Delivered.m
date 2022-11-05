clc
clear all

Y = 0:0.01:1;
m = 1;
K = 0.1;
wn = 10;
E = 0.5;
Rint = 0.5;
Rload = 5;

P = (m*wn^3*Y.^2)*(1-Rint/Rload)/16*E;
plot(Y,P);
title("Maximum Power Delivered to Load");
xlabel("Amplitude of Base (m)");
ylabel("Maximum Power (W)");
