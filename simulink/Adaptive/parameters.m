clear all; close all; clc;

addpath('../.')


% Intialize myRobot and initial conditions
main_Adaptive_Control


KD = 100;
lambda = 80;
K_theta = eye(3,3);

I_initial = 1;
I_real = 1;
F_initial = 1;
F_real = 1;
G_initial = 2;
G_real = 2;

% Multi-points Trajecotry with continous accelerations

k = [3];

qk_1 = [pi/4]';
qk_2 = [pi/2]';
qk_3 = [pi/4]';



dqi = [0]';
dqf = [0]';

qk = [qk_1, qk_2, qk_3];
tk = [0 1.5 30];

q0 = qk_1;
dotq0 = dqi;

Ts = 0.001;

DimValues = 1;

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

