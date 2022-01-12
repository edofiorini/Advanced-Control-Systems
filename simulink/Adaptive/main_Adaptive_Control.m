clear all; close all;clc;

% initialize the initial conditions 

% q1 = 0;
% q2 = 0;
% q3 = 0.0;
% 
% dq1 = 0;
% dq2 = 0;
% dq3 = 0;

myRobot.dof = 1;
myRobot.q0 = [0;];%[q1;q2;q3];
myRobot.dq0 = [0;]; %[dq1;dq2;dq3];

% import the URDF file
robot = importrobot('RRP_2.urdf');
showdetails(robot)


