clc;
clear all;
close all;
%% robot parameter
syms L1 L2 theta1 theta2
L1 = 14
L2 = 18
theta1 = -1.6439;
theta2 = 2.8735;


%% DH table
DH = [0 0 0 theta1;
     L1 0 0 theta2]
%      L2 0 0 0];
P_EE = [L2; 0 ;0 ;1]
T_0_n = eye(4);

%%Allocate memory for P_0_iORG
P_0_i = sym(zeros(3,4));
P_0_EE = sym(zeros(3,4));

for i=1:2
    a = DH(i,1);
    alpha = DH(i,2);
    d = DH(i,3);
    the = DH(i,4);
    
    T_1_i_1 = FK(a,alpha,d,the);
    T_0_n = T_0_n*T_1_i_1;
end 
% T_0_2 = simplify(T_0_n)
P_0_EE = T_0_n*P_EE  ;
P_0_EE = P_0_EE(1:3)
    