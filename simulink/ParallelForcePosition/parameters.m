clear all; close all; clc;

addpath('../.')

% Intialize myRobot and initial conditions
main

%            [x y z]
KP = diag([3700 370 370]);
KD = diag([55 55 55]);

% KP = diag([20 20 20]);
% KD = diag([10 10 10]);
Md = diag([0.01 0.1 0.1]);
%Md = diag([0.001 0.1 0.1]);

Ts = 0.001;
% compliance between "force error reference pose" and force error

KFP = diag([0.5 0.5 0.5]);
KFI = diag([1.5 1.5 1.5]);

K = diag([12 10 15 0.1 0.1 0.1]);    % stiffness

