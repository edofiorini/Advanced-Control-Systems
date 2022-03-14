% Main for 3DoF_robots -- Assignment 1
clear all; close all; clc;

% import the URDF file
robot = importrobot('RRP_2.urdf');
joints = ["R", "R" ,"P"];
showdetails(robot)
dh;

% define the configuration
[q1, q2, q3, dq1, dq2, dq3, ddq1, ddq2, ddq3, d0, a1, a2, l3] = defineConfiguration();
% 
% figure(1);
config = homeConfiguration(robot);
% show(robot,config);

config(1).JointPosition = q1;
config(2).JointPosition = q2;
config(3).JointPosition = q3;


show(robot,config);
% xlim([-0.5 0.8])
% ylim([-0.5 0.5])
% zlim([0 0.8]) 
%% Direct Kinematics

directkinematicsTool = getTransform(robot,config, 'ee', 'base_link');

% wrt frame b
[directkinematicsManualS, P, Z, R, TJ01, RH, PH, P_b] = directKinematics(dhTable);
directkinematicsManual = eval(directkinematicsManualS);

%% Inverse Kinematics Manually

%if you want initialize a xd vector
%directkinematicsManualS = [[zeros(4,3)], [0.5; 0.2; 0.9;0]];

%IK from base 
%find d3
d3 = - directkinematicsManualS(2,4) - l3;
d3 = eval(d3);

%find c2 and s2
Px = directkinematicsManualS(1,4);
Pz = directkinematicsManualS(3,4);
c2 = (Px^2 + (Pz - d0)^2 - a1^2 - a2^2)/ (2*a1*a2); 
s2 = abs(sqrt(1-c2^2));
theta2 = atan2(s2,c2);
theta2 = eval(theta2);

%find c1 and s1
c1 = ((a1 + a2*c2)*Px + a2*s2*(Pz - d0))/(Px^2 + (Pz - d0)^2);
s1 = ((a1 + a2*c2)*(Pz - d0) - a2*s2*Px)/(Px^2 + (Pz - d0)^2);
theta1 = atan2(s1,c1);
theta1 = eval(theta1);

% IK from frame 0
% % find d3
% d3 = directkinematicsManualS(3,4) - l3;
% %d3 = eval(d3);
% find c2 and s2
% Px = directkinematicsManualS(1,4);
% Pz = directkinematicsManualS(2,4);
% d0 = 0;
% c2 = (Px^2 + (Pz - d0)^2 - a1^2 - a2^2)/ (2*a1*a2); 
% s2 = abs(sqrt(1-c2^2));
% theta2 = atan2(s2,c2);
% %theta2 = eval(theta2);
% 
% % find c1 and s1
% c1 = ((a1 + a2*c2)*Px + a2*s2*(Pz - d0))/(Px^2 + (Pz - d0)^2);
% s1 = ((a1 + a2*c2)*(Pz - d0) - a2*s2*Px)/(Px^2 + (Pz - d0)^2);
% theta1 = atan2(s1,c1);
% %theta1 = eval(theta1);
%% %% Inverse Kinematics
%Create an inverse kinematics object
ik = inverseKinematics('RigidBodyTree',robot);
% Set up desired end-effector pose, weights and initial guess
tform = directkinematicsTool;
weights = [0.25 0.25 0.25 1 1 1];
initialguess = robot.homeConfiguration;
% Call IK solver
[configSoln,solnInfo] = ik('ee',tform,weights,initialguess);

%% Geometric Jacobian 

geoJacobianTool = geometricJacobian(robot, config, 'ee')

% wrt frame 0
[geoJacobianManualS] = geometricJacobianManual(dhTable,joints);
% wrt frame b
geoJacobianManualSBase = TJ01*geoJacobianManualS;
geoJacobianManualBase = eval(geoJacobianManualSBase);

%% Analytical Jacobian

syms q1 q2 q3
analyticalJacobianS = jacobian([directkinematicsManualS(1:3,4)], [q1,q2,q3]);
analyticalJacobian = eval(analyticalJacobianS);

%% Matrix T that maps geometrical Jacobian into analytical jacobian

% wrt frame 0
[JaS, Ta] = analyticalJacobian(geoJacobianManualS);
Ja = eval(JaS);

