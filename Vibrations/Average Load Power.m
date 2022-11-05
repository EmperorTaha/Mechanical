clc
clear all

Y = 0:0.01:1;
[Rint,Y] = meshgrid(0:0.5:10,0:1);
m = 1;
K = 0.1;
wn = 10;
cm = 1.414;
Rint = 0.5;

P = (K^2*m^2*wn^4*Y.^2)/8*cm*(cm*Rint+K^2);
surf(Y,Rint,P)



