%This program solves the base excitation problem. The
%code assumes a sinusoidal base function. Also, the
%program tests three di§erent natural frequencies.
%
y0=input('Enter the base excitation magnitude. ');
zeta=input('Enter the damping ratio (zeta). ');
if (zeta<0 | zeta>=1) % The usual test on damping ratio.
error("Damping ratio not in acceptable range!")
end
wn=4;
tf=10;
t=0:tf/1000:tf;
for k=1:1
wb(k)=input('Enter a base excitation frequency. ');
end
for m=1:1
%
%This section solves the transient response, using the
%equations obtained from MAPLE.
%
wd=wn*sqrt(1-zeta^2);
phi1=atan2(2*zeta*wn*wb(m),(wn^2-wb(m)^2));
phi2=atan2(wn,2*zeta*wb(m));
xi=phi1+phi2;
%These constants are what produces the two possible
%solutions discussed above. Notice the way by which
%the extraordinarily long expressions for the constants
%are broken into parts, to keep the expressions from
%spreading over several lines.
Z1=(-zeta*wn-wb(m)*tan(xi)+sqrt((zeta*wn)^2+2*zeta* ...
wn*wb(m)*tan(xi)+(wb(m)*tan(xi))^2+wd^2))/wd;
Z2=(-zeta*wn-wb(m)*tan(xi)-sqrt((zeta*wn)^2+2*zeta* ...
wn*wb(m)*tan(xi)+(wb(m)*tan(xi))^2+wd^2))/wd;
Anum=sqrt((wn^2+(2*zeta*wb(m))^2)/((wn^2-wb(m)^2)^2+(2* ...
zeta*wb(m)*wn)^2))*wn*y0;
Bnum1=(-wd*cos(xi)+Z1*zeta*wn*cos(xi)+Z1*wb(m)*sin(xi));
Bnum2=(-wd*cos(xi)+Z2*zeta*wn*cos(xi)+Z2*wb(m)*sin(xi));
Aden1=wd*Z1;
Aden2=wd*Z2;
A1=Anum*Bnum1/Aden1;
A2=Anum*Bnum2/Aden2;
th1=2*atan(Z1);
th2=2*atan(Z2);
y1(m,:)=A1*exp(-zeta*wn*t).*sin(wd*t+th1);
y2(m,:)=A2*exp(-zeta*wn*t).*sin(wd*t+th2);
43
end
%This portion solves the steady-state response.
for j=1:1
A=sqrt((wn^2+(2*zeta*wb(j))^2)/((wn^2-wb(j)^2)^2+(2*zeta* ...
wn*wb(j))^2));
phi1=atan2(2*zeta*wn*wb(j),(wn^2-wb(j)^2));
phi2=atan2(wn,(2*zeta*wb(j)));
xp(j,:)=wn*y0*A*cos(wb(j)*t-phi1-phi2);
end
if (xp(1,1)+y1(1,1)==xp(2,1)+y1(2,1)==xp(3,1)+y1(3,1)==0)
x=xp+y1;
else
x=xp+y2;
end
subplot(3,1,i)
plot(t,x(i,:))
ylabel("Response x");
title(["Base Excitation with wb=",num2str(wb(i))," and wn=",num2str(wn)]);
grid
xlabel("Time, seconds")