clc
clear all
% l(1)=Link([0,0.5,0,0]);
l(1)=Link([0,0,0.6,0]);
l(2)=Link([0,0,0.5,0]);
l(3)=Link([0,0,0.4,0]);
robot=SerialLink(l);
% robot.plot([0,0,0,0])
n = 0;
for t = 0.01:0.01:1;
p_x = 1.0*t.^2;
p_y = 0.3*t.^2;
p_z = 0.5*t;
n=n+1;
t
T = transl(p_x, p_y, p_z);
rad1 = 2.5 - 3.0*t;
if t<0.7
    rad2 = 1.7 + (1.2/0.7)*t;
else
    rad2 = 5.0-0.9*t/0.3;
end
T1 = robot.ikine(T, 'q0', [0, rad1, rad2],'mask',[1, 1, 0, 0, 0, 0]);
d_1(1,n) = T1(1);
q2(1,n) = T1(2);
q3(1,n) = T1(3);
end
t = 0.01:0.01:1;

% plot(t,d_1);
% title('Graph of d_1 against time');
% xlabel('t (sec)');
% ylabel('d1 (m)');

plot(t,q2);
title('Graph of q2 against time');
xlabel('t (sec)');
ylabel('q2 (rad)');

% plot(t,q3);
% title('Graph of q3 against time');
% xlabel('t (sec)');
% ylabel('q3 (m)');

