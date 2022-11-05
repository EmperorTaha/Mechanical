clc
clear all

Y = 0:0.01:1;
m = 1;
K = 0.1;
wn = 10;
cm = 1.414;
Rint = 0.5;

P = (K^2*m^2*wn^4*Y.^2)/8*cm*(cm*Rint+K^2);
plot(Y,P);
title("Average Power Delivered to Load");
xlabel("Amplitude of Base (m)");
ylabel("Average Power (W)");



