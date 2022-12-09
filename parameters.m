close all;
clear variables;
clc;

c1 = 1500;
c2 = c1;

k1 = 21000;
k2 = k1;

kt1 = 150000;
kt2 = kt1;

m1 = 40;
m2 = m1;

m = 400;

Iyy = 600;
ar = 1.45;
af = 0.8;

l5 = 1/m*[-(k1+k2) k1*af-k2*ar k1 k2 -(c1+c2) c1*af-c2*ar c1 c2];
l6 = 1/Iyy*[af*k1-ar*k2 -(af^2*k1+ar^2*k2) -af*k1 ar*k2 af*c1-ar*c2 -(af^2*c1+ar^2*c2) -af*c1 ar*c2];
l7 = 1/m1*[k1 -k1*af -(k1+kt1) 0 c1 -c1*af -c1 0];
l8 = 1/m2*[k2 k2*ar 0 -(kt2+k2) c2 ar*c2 0 -c2];

A = [zeros(4,4)      eye(4,4);
    l5;
    l6;
    l7;
    l8];

B = [0 0;
    0 0;
    0 0;
    0 0;
    0 0;
    0 0;
    kt1/m1 0;
    0 kt2/m2];

C = [1 0 0 0 0 0 0 0 ;
     0 1 0 0 0 0 0 0 ;
     0 0 0 0 1 0 0 0 ;
     0 0 0 0 0 1 0 0];

D = [0 0;
     0 0;
     0 0;
     0 0];

C2 = [1 0 0 0 0 0 0 0];
D2 = [0 0];

sys = ss(A, B, C, D);
[Num, Den] = ss2tf(A, B, C, D, 2);
[Num2, Den2] = ss2tf(A, B, C2, D2, 1);

s = tf('s');
zpk(sys);

