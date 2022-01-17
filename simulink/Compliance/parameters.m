clear all; close all; clc;

addpath('../.')

% Intialize myRobot and initial conditions
main

%         [   x    y    z  phi theta psi]
KP = diag([1700  3000  1600  100  1  4]);
%KP = diag([1  1  1  1  1  1]);
KD = diag([  150   180   160    19     0   8]);
%KD = diag([  0   0   0    0     0   0]);

K = 10*diag([1 1 30 1 1 1]);    % stiffness



