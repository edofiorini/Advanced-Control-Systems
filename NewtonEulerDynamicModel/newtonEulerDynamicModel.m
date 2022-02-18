% Newton Euler Dynamic Model -- Assignment 4
clear all; close all; clc;

addpath('../Energy','../LagrangianDynamicModel' )
dh;
defineMechanicalParameters;
q = [q1; q2; q3];
dq = [dq1; dq2; dq3];
ddq = [ddq1; ddq2; ddq3];
[tau] = recursiveNewtonEuler(dq, ddq, 1);

[q1, q2, q3, dq1, dq2, dq3, ddq1, ddq2, ddq3, d0, a1, a2, l3, mu1, mu2, mu3, f1, f2, f3] = defineConfiguration();

% Compare the rne with lagrangian

cmp = 'G';
if(strcmp(cmp, 'G'))
    disp('RNE')
    eval(tau)
    disp('LAGRANGIAN')
    lagrangianDynamicModel;
    eval(G)
elseif(strcmp(cmp, 'C'))
    disp('RNE')
    second = eval(tau);
    dq1 = 1;
    dq2 = 1;
    dq3 = 1;
    eval(tau) - second
    disp('LAGRANGIAN')
    lagrangianDynamicModel;
    dq1 = 1;
    dq2 = 1;
    dq3 = 1;
    eval(C*dq)
else
    disp('RNE')
    [tau] = recursiveNewtonEuler(dq, ddq, 0);
    ddq1 = 0;
    ddq2 = 0;
    ddq3 = 1;
    eval(tau)
    lagrangianDynamicModel;
    eval(B)
end



