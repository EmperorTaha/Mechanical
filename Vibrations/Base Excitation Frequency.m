%This program solves the base excitation problem. The
%code assumes a sinusoidal base function. Also, the
%program tests three di§erent damping ratios. Again, note
%the changes between this program and the previous one.
%
y0=input('Enter the base excitation magnitude. ');
wb=input('Enter the base excitation frequency. ');
wn=4;
tf=10;
t=0:tf/1000:tf;
for k=1:3
zeta(k)=input('Enter a damping ratio (zeta). ');
if (zeta(k)<0 | zeta(k)>=1) % The usual test on damping ratio.
error('Damping ratio not in acceptable range!')
end
end
for m=1:3
wd=wn*sqrt(1-zeta(m)^2);
phi1=atan2(2*zeta(m)*wn*wb,(wn^2-wb^2));
phi2=atan2(wn,2*zeta(m)*wb);
xi=phi1+phi2;
Z1=(-zeta(m)*wn-wb*tan(xi)+sqrt((zeta(m)*wn)^2+2*zeta(m)* ...
wn*wb*tan(xi)+(wb*tan(xi))^2+wd^2))/wd;
Z2=(-zeta(m)*wn-wb*tan(xi)-sqrt((zeta(m)*wn)^2+2*zeta(m)* ...
wn*wb*tan(xi)+(wb*tan(xi))^2+wd^2))/wd;
Anum=sqrt((wn^2+(2*zeta(m)*wb)^2)/((wn^2-wb^2)^2+(2* ...
zeta(m)*wb*wn)^2))*wn*y0;
Bnum1=(-wd*cos(xi)+Z1*zeta(m)*wn*cos(xi)+Z1*wb*sin(xi));
Bnum2=(-wd*cos(xi)+Z2*zeta(m)*wn*cos(xi)+Z2*wb*sin(xi));
Aden1=wd*Z1;
Aden2=wd*Z2;
A1=Anum*Bnum1/Aden1;
A2=Anum*Bnum2/Aden2;
th1=2*atan(Z1);
th2=2*atan(Z2);
y1(m,:)=A1*exp(-zeta(m)*wn*t).*sin(wd*t+th1);
y2(m,:)=A2*exp(-zeta(m)*wn*t).*sin(wd*t+th2);
end
for j=1:3
A=sqrt((wn^2+(2*zeta(j)*wb)^2)/((wn^2-wb^2)^2+(2*zeta(j)* ...
wn*wb)^2));
phi1=atan2(2*zeta(j)*wn*wb,(wn^2-wb^2));
phi2=atan2(wn,(2*zeta(j)*wb));
xp(j,:)=wn*y0*A*cos(wb*t-phi1-phi2);
end
47
if (xp(1,1)+y1(1,1)==xp(2,1)+y1(2,1)==xp(3,1)+y1(3,1)==0)
x=xp+y1;
else
x=xp+y2;
end
for i=1:3
subplot(3,1,i)
plot(t,x(i,:))
ylabel('Response x');
title(['Base Excitation with wb=',num2str(wb),'and zeta=',num2str(zeta(i))]);
grid
end
xlabel('Time, seconds')