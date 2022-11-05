clc
clear all
l(1)=Link([0,0.5,0,0]);
l(2)=Link([0,0,0.6,0]);
l(3)=Link([0,0,0.5,0]);
l(4)=Link([0,0,0.4,0]);
robot=SerialLink(l);
% robot.plot([0,0,0,0])
n = 0;
for t = 0:0.01:1;
q2=pi/6*t+pi/4*(t^2);
q3=pi/5*t+pi/8*(t^2);
d1=0.5*t;;
n=n+1;
T = transl(robot.fkine([0,0,q2,q3]));
p_x(1,n) = T(1,1);
p_y(1,n) = T(1,2);
p_z(1,n) = T(1,3);
end
t = 0:0.01:1;

plot(t,p_x);
title('Graph of px against time');
xlabel('t (sec)');
ylabel('px (m)');

plot(t,p_y);
title('Graph of py against time');
xlabel('t (sec)');
ylabel('py (m)');

plot(t,p_z);
title('Graph of pz against time');
xlabel('t (sec)');
ylabel('pz (m)');

