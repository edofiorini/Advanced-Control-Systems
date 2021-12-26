clear all; close all; clc;

addpath('../.')

% Intialize myRobot and initial conditions
main

%         [   x    y    z  phi theta psi]
KP = diag([ 625  2500  1600  100  1  4]);
KD = diag([  47.5   100   160    19     0   8]);

