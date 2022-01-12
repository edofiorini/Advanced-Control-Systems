clear all; close all; clc;

addpath('../.')

% Intialize myRobot and initial conditions
main

%            [x y z]
KP = diag([25 25 25]);
KD = diag([15 15 15]);

Md = 0.75*diag([1 1 1]);


% compliance between "force error reference pose" and force error

KFP = diag([0.5 0.5 0.5]);
KFI = diag([1.5 1.5 1.5]);

K = diag([15 15 15 0.1 0.1 0.1]);    % stiffness