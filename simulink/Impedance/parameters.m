clear all; close all; clc;

addpath('../.')


% Intialize myRobot and initial conditions
main

%        [   x    y    z  phi theta psi]
KP = diag([  9000  64000   2025    1   1     1]);
KP = diag([1700  3000  1600  100  1  4]);
KD = diag([ 30  240  135    0   0     0]);
KD = diag([  150   180   160    19     0   8]);

Md = 20*diag([1 1 1 1 1 1]);

K = diag([2 2 3 2 2 2]); %stiffness 

% Multi-points Trajecotry with continous accelerations

k = [3 3 3];

qk_1 = [pi/4 -pi/6  0.1]';
qk_2 = [pi/2 pi/4 -0.3]';
qk_3 = [pi/6 -pi/3 0.1]';
qk_4 = [pi/4 -pi/6 0.2]';
dqi = [0 0 0]';
dqf = [0 0 0]';

qk = [qk_1, qk_2, qk_3, qk_4];
tk =  [0 1.5 3 5];

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
