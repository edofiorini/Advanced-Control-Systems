clear all; close all; clc;

addpath('../.')

% Intialize myRobot and initial conditions
main

%         [   x    y    z  phi theta psi]
KP = diag([1700  3000  1600  100  1  4]);
KD = diag([  150   180   160    19     0   8]);

