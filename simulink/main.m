clear all; close all;clc;

% initialize the initial conditions 

myRobot.dof = 3;
myRobot.q0 = [0;0;0];%[q1;q2;q3];
myRobot.dq0 = [0;0;0]; %[dq1;dq2;dq3];

% import the URDF file
robot = importrobot('RRP_2.urdf');
showdetails(robot)


