% Compute the quation of motion -- Assignment 3
%clear all; close all; clc;

dh;
defineMechanicalParameters;
q = [q1; q2; q3];
dq = [dq1; dq2; dq3];
ddq = [ddq1; ddq2; ddq3];


[B] = intertialMatrix(nlinks, joints, parameters, dhTable, lengthOfLink);
[C] = coriolisMatrix(q, dq, B);
[G] = gravityMatrix(parameters(:,5), nlinks, dhTable, joints, lengthOfLink, g0);

%tau = B*ddq + C*dq + G;

[q1, q2, q3, dq1, dq2, dq3, ddq1, ddq2, ddq3, d0, a1, a2, l3] = defineConfiguration();
%[lq1, lq2, lq3, ldq1, ldq2, ldq3, lddq1, lddq2, lddq3, ld0, a1, a2, l3] = defineConfiguration();

