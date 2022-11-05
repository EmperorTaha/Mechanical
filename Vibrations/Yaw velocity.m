clc
clear all

t = 0:0.01:1;
y = 0.6446*(1 - exp(-4.561.*t));
z = 2.94*t;
plot(t,y);
hold on
plot(t,z);
xlim([0 1])
ylim([0 0.7])
title("Open loop response of yaw velocity against time");
xlabel("Time (s)");
ylabel("Yaw velocity (rad/s)");