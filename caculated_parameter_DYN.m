%from kinematic of robot we can find: 

%% 
syms theta1 theta2 I1 I2 L1 L2 de1 de2 m1 m2 g dde1 dde2 x1 y1 z1 x2 y2 z2
assume(L1,'real');
assume(L2,'real');
assume(theta1,'real');
assume(theta2,'real');
assume(de1,'real');
assume(de2,'real');
assume(m1,'real');
assume(m2,'real');
assume(I1,'real');
assume(I2,'real');
assume(g,'real');
assume(dde1,'real');
assume(dde2,'real');
assume(x1,'real');
assume(x2,'real');
assume(y1,'real');
assume(y2,'real');
assume(z1,'real');
assume(z2,'real');

%% forward kinematic
[T_0_1,R_0_1,R_1_0,P_0_1] = FK_DYN(0,0,0,theta1);
[T_1_2,R_1_2,R_2_1,P_1_2] = FK_DYN(0,L1,0,theta2);
%% Position of center of mass in each linkage:
P_1_c1=[x1 y1 z1]';
P_2_c2=[x2 y2 z2]';
w0=[0 0 0]';
v0=[0 0 0]';

%% linkage 1
% mass center
TP_0_c1 = (T_0_1*[P_1_c1;1]);
P_0_c1 = TP_0_c1(1:3);
% angular velocity 
w1 = R_1_0 * w0 + de1*[0 0 1]';
% Linear velocity in origin 
v1 = R_1_0 * (v0 + [0 -w0(3) w0(2); w0(3) 0 -w0(1); -w0(2) w0(1) 0]*P_0_1);
% Linear velocity in center
v_0_c1 = R_0_1 * (v1 + [0 -w1(3) w1(2); w1(3) 0 -w1(1); -w1(2) w1(1) 0]*P_1_c1);
%% linkage 2
% mass center
TP_0_c2 = (T_0_1*T_1_2*[P_2_c2;1]);
P_0_c2 = TP_0_c2(1:3);
% angular velocity 
w2 = R_2_1*w1 + (de2)*[0 0 1]';
% Linear velocity in origin 
v2 = R_2_1 * (v1 + [0 -w1(3) w1(2); w1(3) 0 -w1(1); -w1(2) w1(1) 0]*P_1_2);
% Linear velocity i center
v_0_c2 = R_0_1*R_1_2 * (v2 + [0 -w2(3) w2(2); w2(3) 0 -w2(1); -w2(2) w2(1) 0]*P_2_c2);