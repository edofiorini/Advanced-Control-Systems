clear all; close all; clc;

%1) see that with the step and all parameters there is the same behavior
%  because we are working with a 3 linear models that are the same. The
%  settling time(time to reach the step). If we change of course we have
%  different behavior for all three dof.

%2) We have to use different value of B,C and G in the control law. 
% The manipulator must be the same, we have to change the parameters in
% order to be sure for the uncertainty

% 3) You have to see the relation between torque and response. You can change 
% the settling time but there is a saturation in the torque due to the actuoators.
% you have to change the rigth parameters in order to find the rigth
% trade-off.

% I have in stady-state error in torque equal to zero in d3 because i
% doesn't depend on gravity. The other two depend on gravity, so the torque
% is not equal to zero because we have to compensate. Important that
% gravity is only for the joints that are affected, for the other of course
% if we move C and B we have a behavior everything. 

% In steady state remane only G, because velocity and acc are 0 so B anf G
% zero. Remain G, so if we have perfect we are to zero asyntotically
% otherwise with error in G we are not in zero. 



addpath('../.')


% Intialize myRobot and initial conditions
main

%     theta1  theta2  d3
KP = diag([200 200 200]);
KD = diag([ 24  24  24]);


% Multi-points Trajecotry with continous accelerations

k = [4 4 4];

qk_1 = [pi/4 -pi/6  0.1]';
qk_2 = [pi/2 pi/4 -0.3]';
qk_3 = [pi/6 -pi/3 0.1]';
qk_4 = [pi/4 -pi/6 0.2]';


dqi = [0 0 0]';
dqf = [0 0 0]';

qk = [qk_1, qk_2, qk_3, qk_4];
tk = [0 1.5 3 5];

q0 = qk_1;
dotq0 = dqi;

Ts = 0.001;

DimValues = 3;

DataPositions = [];
DataVelocities = [];
DataAccelerations = [];

for i=1:DimValues
    
    [q, dq, ddq, T, dqk] = continuousAccelerations(qk(i,:), tk, k(1,i), dqi(i,1), dqf(i,1), Ts);
    %[q, dq, Qdd, T] = computedVelocities(qk(i,:), tk, k(1,i), dqi(i, 1), dqf(i, 1), Ts);
    
    DataPositions(i, :) = q;
    DataVelocities(i, :) = dq;
    DataAccelerations(i,:) = ddq;  
    
end



qd.time=T;
qd.signals.values=DataPositions';
qd.signals.dimensions=DimValues;

dqd.time=T;
dqd.signals.values=DataVelocities';
dqd.signals.dimensions=DimValues;

ddqd.time=T;
ddqd.signals.values=DataAccelerations';
ddqd.signals.dimensions=DimValues;

