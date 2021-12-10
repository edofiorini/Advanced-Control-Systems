% DH table of the robot

% If you want you can add some parameters

syms q1 q2 q3 dq1 dq2 dq3 ddq1 ddq2 ddq3 a1 a2 l3 d0 tau1 tau2 tau3 'real'

dof = 3;
               % a  alpha d  theta
dhTable = [
                0,  pi/2, d0,  0;
                a1, 0,    0,   q1 ;
                a2, 0,    0,   q2;
                0,  0,    l3 + q3,  0

                                        ];

