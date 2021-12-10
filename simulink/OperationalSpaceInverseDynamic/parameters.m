clear all; close all; clc;

addpath('../.')


% Intialize myRobot and initial conditions
main

%        [    x    y    z   phi theta psi]
w = diag([   15   30   30    10   1     1]);
z = diag([ 0.95 0.95 0.95  0.95   0     0]);

KP = w^2;
KD = 2*z*w;

% Multi-points Trajecotry with continous accelerations

k = [3 3 3];

qk_1 = [pi/4 -pi/4  0.1]';
qk_2 = [pi/2 pi/4 -0.1]';
qk_3 = [pi/4 -pi/6 0.2]';



dqi = [0 0 0]';
dqf = [0 0 0]';

qk = [qk_1, qk_2, qk_3];
tk = [0 1.5 2];

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
