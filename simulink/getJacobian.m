function [J] = getJacobian(q)
    
    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);

    % wrt frame 0
    J = [[ - (3*sin(theta1 + theta2))/10 - (2*sin(theta1))/5, -(3*sin(theta1 + theta2))/10, 0];
        [   (3*cos(theta1 + theta2))/10 + (2*cos(theta1))/5,  (3*cos(theta1 + theta2))/10, 0];
        [                                     0,                    0, 1];
        [                                     0,                    0, 0];
        [                                     0,                    0, 0];
        [                                     1,                    1, 0]];
    
    J = double(J);
 
end