clc
close all
syms c1 c2 s1 s2 c12 s12
l0=180/1000; l1=140/1000; m1=112.31/1000; m2=40.23/1000;
Izz1=0.0013145182; Izz2=0.0002253531;
n = length(T1);
M = zeros(2,12);
T = zeros(2,1);
g = 9.8;

for i = 1:n
tor1 = T1(i,1);
tor2 = T2(i,1);
the1 = the(i,1);
the2 = the(i,2);
dthe1 = dthe(i,1);
dthe2 = dthe(i,2);
ddthe1 = ddthe(i,1);
ddthe2 = ddthe(i,2);
c1 = cos(the1); s1 = sin(the1);
c12 = cos(the1+the2); s12 = sin(the1+the2);
H = [ddthe1, ddthe1+ddthe2, c1, c12, -s1, -s12, (2*ddthe1 + ddthe2)*c2-(dthe2^2+2*dthe1*dthe2)*s2, -(2*ddthe1 + ddthe2)*s2-(dthe2^2+2*dthe1*dthe2)*c2, sign(the1), dthe1,          0,     0;
          0, ddthe1+ddthe2,  0, c12,   0, -s12,                              ddthe1*c2+dthe1^2*s2,                               dthe1^2*c2-ddthe1*s2,          0,     0, sign(the2), dthe2];
Mn = [M; H];
TOR = [tor1; tor2];
Tn = [T; TOR];
end
F = Mn'*Mn;
matrixH = Mn;
matrixT = Tn;
p = pinv(F)*(matrixH'*matrixT);
x1 = (p(7) - g*l0*m2)/(g*m1);
x2 = p(8)/(g*m2);
y1 = p(9)/(g*m1);
y2 = p(10)/(g*m2);