n = 0;
for t = 0:0.01:1;
n = n+1;
p_x = 1.0*t.^2;
p_y = 0.3*t.^2;
p_z = 0.5*t;
L2 = 0.6;
L3 = 0.5;
L4 = 0.4;
d_1(1,n) = p_z;
c3=((p_x-L2)^2+(p_y)^2-L3^2-L4^2)/(2*L4*L3);
s3=sqrt((1-c3^2));
q3(1,n)=atan2(s3,c3);
K1=L2+L3*c3;
K2=L3*s3;
q2(1,n)=atan2((p_y),(p_x-L2))-atan2(K2,K1);
end
t = 0:0.01:1;

plot(t,d_1);
title('Graph of d1 against time');
xlabel('t (sec)');
ylabel('d1 (m)');

plot(t,q2);
title('Graph of q2 against time');
xlabel('t (sec)');
ylabel('q3 (rad)');

plot(t,q3);
title('Graph of q3 against time');
xlabel('t (sec)');
ylabel('q3 (rad)');