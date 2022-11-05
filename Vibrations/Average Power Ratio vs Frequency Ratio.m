clear
t=0:0.1:15;                                          %time peroid
Y0= input('wave amplitude ') ;                        %Wave amplitude
l= input('length of wave ') ;                        %length of the wave
u=input('speed of boat ');                                                %Boat Velocity
w=u/l;                                               %frequency of wave
y=Y0*sin(w*t);
Dr=0.5;                                              %wave height model
k=17000;                                             %Spring Constant of suspension
m=100;
c=2*Dr*(k*m)^(0.5);                                  %Damping coefficient                                             %Required Damping Ratio
wn=(k/m)^0.5;
wd=wn*(1-Dr^2)^0.5;
                  
syms x(t)
ode=m*diff(x,t,2)+c*diff(x,t)+k*x==y+(2*Dr/wn)*diff(y,t);
xSol(t)=dsolve(ode);
plot(t,xSol)