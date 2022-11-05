t = 0:0.01:1;
q2=pi/6*t+pi/4*(t.^2);
q3=pi/5*t+pi/8*(t.^2);
d1=0.5*t;
p_x = 0.60+0.50*cos(q2)+0.40*cos(q2+q3);
p_y = 0.50*sin(q2)+0.40*sin(q2+q3);
p_z=d1;

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