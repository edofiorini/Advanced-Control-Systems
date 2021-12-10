clear all; close all; clc;


dh;
defineMechanicalParameters;
q = [q1; q2; q3];
dq = [dq1; dq2; dq3];
ddq = [ddq1; ddq2; ddq3];
[tau] = recursiveNewtonEuler(dq, ddq);

[q1, q2, q3, dq1, dq2, dq3, ddq1, ddq2, ddq3, d0, a1, a2, l3, mu1, mu2, mu3, f1, f2, f3] = defineConfiguration();

eval(tau)

% Compare the rne with lagrangian
lagrangianDynamicModel;

eval(G)