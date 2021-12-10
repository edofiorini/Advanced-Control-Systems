clear all; close all; clc;

addpath('../.')

% Intialize myRobot and initial conditions
main

%theta1  theta2  d3
KP = diag([240 240 200]);
KD = diag([ 20  10  21]);