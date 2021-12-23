clear all; close all; clc;

addpath('../.')

% Intialize myRobot and initial conditions
main

%         [   x    y    z  phi theta psi]
KP = diag([ 250  350  100   50     1   1]);
KD = diag([  35   45   15    1     0   0]);

