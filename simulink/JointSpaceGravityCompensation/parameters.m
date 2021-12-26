clear all; close all; clc;

addpath('../.')

% Intialize myRobot and initial conditions
main

%theta1  theta2  d3
KP = diag([250 220 200]);
KD = diag([ 25  10  20]);

