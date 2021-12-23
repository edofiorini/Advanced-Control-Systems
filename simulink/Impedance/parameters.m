clear all; close all; clc;

addpath('../.')


% Intialize myRobot and initial conditions
main

%        [   x    y    z  phi theta psi]
w = diag([  25  100   45    1   1     1]);
z = diag([ 0.5  1.5  1.5    0   0     0]);

Md = diag([2 2 2 2 2 2]);
KP = w^2;
KD = 2*z*w;
K = diag([2 2 2 0.1 0.1 0.1]); %stiffness 

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

%% %% Plot the pose

figure(1);

subplot(3,2,1);
plot(out.x.Time',out.x.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.xd.Time',out.xd.Data(:,1)', 'LineWidth',1.8);
title('x');xlabel('Time'); 
legend('x', 'xd')

subplot(3,2,3);
plot(out.x.Time',out.x.Data(:,2)', 'LineWidth',1.8);
hold on
plot(out.xd.Time',out.xd.Data(:,2)', 'LineWidth',1.8);
title('y');xlabel('Time'); 
legend('y', 'yd')

subplot(3,2,5);
plot(out.x.Time',out.x.Data(:,3)', 'LineWidth',1.8);
hold on
plot(out.xd.Time',out.xd.Data(:,3)', 'LineWidth',1.8);
title('z');xlabel('Time'); 
legend('z', 'zd')

subplot(3,2,2);
plot(out.x.Time',out.x.Data(:,4)', 'LineWidth',1.8);
hold on
plot(out.xd.Time',out.xd.Data(:,4)', 'LineWidth',1.8);
title('phi');xlabel('Time'); 
legend('phi', 'phid')

subplot(3,2,4);
plot(out.x.Time',out.x.Data(:,5)', 'LineWidth',1.8);
hold on
plot(out.xd.Time',out.xd.Data(:,5)', 'LineWidth',1.8);
title('theta');xlabel('Time'); 
legend('theta', 'thetad')

subplot(3,2,6);
plot(out.x.Time',out.x.Data(:,6)', 'LineWidth',1.8);
hold on
plot(out.xd.Time',out.xd.Data(:,6)', 'LineWidth',1.8);
title('psi');xlabel('Time'); 
legend('psi', 'psid')

