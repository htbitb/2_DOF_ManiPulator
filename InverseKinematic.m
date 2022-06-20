clc;
clear all;
close all;

%%
% syms L1 L2 theta1 theta2 x y
L1 = 14
L2 = 18
x = 5 
y = 3

a = 2*x*L1;
b = 2*y*L1;
d = x^2 + y^2 + L1^2 - L2^2;
%% theta1
if (a*a + b*b - d*d) >= 0
    x1 = basic_01(a,b,d)
%     if x1(1,1) > 0 
%        x1 = x1(1,1)
%     else
%        x1 = x1(2,1)
%     end
end
%% theta2
x2 = atan2(y - L1*sin(x1), x - L1*cos(x1)) - x1
% x2_2 = atan2(x - L1*cos(x1), y - L1*sin(x1)) - x1
