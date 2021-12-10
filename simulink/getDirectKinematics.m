function [K] = getDirectKinematics(q)
    

    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);
    


    K = [[cos(theta1)*cos(theta2) - sin(theta1)*sin(theta2), - cos(theta1)*sin(theta2) - cos(theta2)*sin(theta1), 0, (2*cos(theta1))/5 + (3*cos(theta1)*cos(theta2))/10 - (3*sin(theta1)*sin(theta2))/10];
        [cos(theta1)*sin(theta2) + cos(theta2)*sin(theta1),   cos(theta1)*cos(theta2) - sin(theta1)*sin(theta2), 0, (2*sin(theta1))/5 + (3*cos(theta1)*sin(theta2))/10 + (3*cos(theta2)*sin(theta1))/10];
        [                                0,                                   0, 1,                                                                                                           d3 + 2/5];
        [                                0,                                   0, 0,                                                                                                                1];];
 
     K = double(K);
end

