function [sys,x0,str,ts] = joint_frw_dynamics_model(t,x,u,flag, myRobot)
%CSFUNC An example MATLAB file S-function for defining a continuous system.  
%   Example MATLAB file S-function implementing continuous equations: 
%      x' = Ax + Bu
%      y  = Cx + Du
%   
%   See sfuntmpl.m for a general S-function template.
%
%   See also SFUNTMPL.
  
%   Copyright 1990-2009 The MathWorks, Inc.


A=[-0.09   -0.01
    1          0];

B=[ 1   -7
    0   -2];

C=[ 0    2
    1   -5];

D=[-3    0
    1    0];

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes(myRobot);

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u, myRobot);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%
  % Unhandled flags %
  %%%%%%%%%%%%%%%%%%%
  case { 2, 4, 9 },
    sys = [];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end
% end csfunc

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes(myRobot)

sizes = simsizes;
sizes.NumContStates  = 2*myRobot.dof;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2*myRobot.dof;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);

% Initial condition
x0  = [myRobot.q0; myRobot.dq0];
str = [];
ts  = [0 0];

% end mdlInitializeSizes
%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u,myRobot)

n = myRobot.dof;
q = x(1);
dq = x(2);

sys(1) = dq;

% B(q)qDD + C(q,qD)qD + F(q)qD + G(q) = tau - J'he
% all these are just pre computed matrices
B = 1;
C = 1;
G = 2;

sys(2) = -inv(B)* ((C*dq + G)- u);
%, end mdlDerivatives
%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)

sys = x;

% end mdlOutputs
