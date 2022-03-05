function [Rbe,P, Z, R, TJ01, RH, PH, P_b] = directKinematics(dh)

% This script compute the direct Kinematics of the robot starting from the
% DH table

% OUTPUT: direct kinematics and different axis
%        Z : axis for the jacobian
%        R and P : from the base
%        RH and PH for newton euler to have all the frame

syms a d alfa theta a2 d2 alfa2 theta2 a3 d3 alfa3 theta3 a4 d4 alfa4 theta4 'real'

% From base to first joint
Rb0 = [
    cos(theta) -sin(theta)*cos(alfa) sin(theta)*sin(alfa) a*cos(theta);
    sin(theta) cos(theta)*cos(alfa) -cos(theta)*sin(alfa) a*sin(theta);
    0           sin(alfa)           cos(alfa)               d;
    0               0                   0                   1
];

% From first joint to second
R01 = [
    cos(theta2) -sin(theta2)*cos(alfa2) sin(theta2)*sin(alfa2) a2*cos(theta2);
    sin(theta2) cos(theta2)*cos(alfa2) -cos(theta2)*sin(alfa2) a2*sin(theta2);
    0           sin(alfa2)           cos(alfa2)               d2;
    0               0                   0                   1
];

% from second to third
R12 = [
    cos(theta3) -sin(theta3)*cos(alfa3) sin(theta3)*sin(alfa3) a3*cos(theta3);
    sin(theta3) cos(theta3)*cos(alfa3) -cos(theta3)*sin(alfa3) a3*sin(theta3);
    0           sin(alfa3)           cos(alfa3)               d3;
    0               0                   0                   1
];

% from third to ee
R23 = [
    cos(theta4) -sin(theta4)*cos(alfa4) sin(theta4)*sin(alfa4) a4*cos(theta4);
    sin(theta4) cos(theta4)*cos(alfa4) -cos(theta4)*sin(alfa4) a4*sin(theta4);
    0           sin(alfa4)           cos(alfa4)               d4;
    0               0                   0                   1
];

% Final transformation
Rbe = Rb0*R01*R12*R23;



if(exist('dh','var'))

    a = dh(1,1);
    d = dh(1,3);
    alfa = dh(1,2);
    theta = dh(1,4);
    a2 = dh(2,1);
    d2 = dh(2,3);
    alfa2 = dh(2,2);
    theta2 = dh(2,4);
    a3 = dh(3,1);
    d3 = dh(3,3);
    alfa3 = dh(3,2);
    theta3 = dh(3,4);
    a4 = dh(4,1);
    d4 = dh(4,3);
    alfa4 = dh(4,2);
    theta4 = dh(4,4);

    Rbe = eval(Rbe);
    Rb0 = eval(Rb0);
    R01 = eval(R01);
    R12 = eval(R12);
    R23 = eval(R23);
    
    % We have to consider the first rotation from base link to frist joint?
    % R01??
    T02 = R01;
    T03 = R01*R12;
    T04 = R01*R12*R23;
    
    p0 = [0 0 0]';
    p1 = Rb0(1:end-1,end);
    p2 = T02(1:end-1,end);
    p3 = T03(1:end-1,end);
    p4 = T04(1:end-1,end);
    
    % wrt frame 0
    P = [p1, p2, p3, p4];
    
    % wrt frame b
    P_b = Rb0*R01;
    %Pp = [p0, p1, p2, p3, p4];
     
    r2 = T02(1:3,1:3);
    r3 = T03(1:3,1:3);
    r4 = T04(1:3,1:3);
    
    %z1 = [0 -1 0]';
    z1 = [0 0 1]';
    z2 = r2(:,end);
    z3 = r3(:,end);
    z4 = r4(:,end);
    
    % w.r.t frame 0
    Z = [z1, z2, z3, z4];
    % Zp = [[0, 0, 1], z2, z3, z4];
    % w.r.t base 
    R = [Rb0(1:3,1:3),  r2, r3, r4];
    %Rp = [eye(3,3),  r2, r3, r4];
    
    TJ01 = [Rb0(1:3,1:3)  zeros(3, 'sym'); 
            zeros(3, 'sym')  Rb0(1:3,1:3)];
        
    RH = cat(3, R01(1:3,1:3), R12(1:3,1:3), R23(1:3,1:3), eye(3,3));
    PH = cat(3, R01(1:3,4), R12(1:3,4), R23(1:3,4), [0;0;1]);
     
end


end 