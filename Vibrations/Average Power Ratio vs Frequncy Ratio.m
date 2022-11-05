clc
clear all

r = 0:0.05:4;
E = 0.3;
P = E*(r.^2)./(((1 - (r.^2)).^2)+(2*E*r).^2);
plot(r,P);
hold on

E = 0.5;
P = E*(r.^2)./(((1 - (r.^2)).^2)+(2*E*r).^2);
plot(r,P);
hold on

E = 0.7;
P = E*(r.^2)./(((1 - (r.^2)).^2)+(2*E*r).^2);
plot(r,P);
hold on

E = 0.9;
P = E*(r.^2)./(((1 - (r.^2)).^2)+(2*E*r).^2);
plot(r,P);
hold on

E = 1.1;
P = E*(r.^2)./(((1 - (r.^2)).^2)+(2*E*r).^2);
plot(r,P);
hold on

E = 1.3;
P = E*(r.^2)./(((1 - (r.^2)).^2)+(2*E*r).^2);
plot(r,P);
hold on

E = 1.5;
P = E*(r.^2)./(((1 - (r.^2)).^2)+(2*E*r).^2);
plot(r,P);
hold on
h = vline(1,'r','r = 1')
hold on
title("Average Power Ratio agsinst Frequency Ratio");
xlabel("Frequency Ratio (r)");
ylabel("Average Normalized Power");
legend("E = 0.3","E = 0.5","E = 0.7","E = 0.9","E = 1.1","E = 1.3","E = 1.5");

