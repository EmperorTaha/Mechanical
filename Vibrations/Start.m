clc
clear all

sys = tf(0.664,[0.219 1]);
t = 0:0.01:5;
Uin = ones(size(t));
[y,t] = lsim(sys,Uin,t);
plot(t,y);