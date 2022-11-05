clc
clear all

E = 0.:0.01:0.707;
wrwn = sqrt(1-2*E.^2);
plot(E,wrwn);
title("Ratio of resonant to natural frequency against damping ratio")
xlabel("Damping Ratio E");
ylabel("Ratio of resonant to natural frequency wr/wn");
