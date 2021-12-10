% Compute the Energy of 3 Dof Robot -- Assignment 2

clear all; close all; clc;


dh;
defineMechanicalParameters;

dq = [dq1; dq2; dq3];
q = [q1; q2; q3];


 
[B] = intertialMatrix(nlinks, joints, parameters, dhTable, lengthOfLink);

% Symbolic result of the kinetic Energy
Eks = simplify(1/2*dq'*B*dq);

% Compute the Potential Energy of 3 Dof Robot

Eps = 0;

for link = 1:nlinks

    [directkinematicsManualS,P, Z, R] = directKinematics(dhTable);
    [Pli] = computePCoM(R, P, link, lengthOfLink(link), joints);
    
    % symbolic result of the potential energy
    Eps = Eps +  (-parameters(link,5)*g0'*Pli);
end

Eps = simplify(Eps);

[q1, q2, q3, dq1, dq2, dq3, ddq1, ddq2, ddq3, d0, a1, a2, l3] = defineConfiguration();
Ek = eval(Eks);
Ep = eval(Eps);