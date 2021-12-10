function [dJA] = getDAnalyticalJacobian(q, dq)

    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);

    dtheta1 = dq(1);
    dtheta2 = dq(2);
    dd3 = dq(3);

    dJA = [[ - 2/5*dtheta1*cos(theta1) - 3/10*cos(theta1 + theta2)*(dtheta1 + dtheta2), -3/10*cos(theta1 + theta2)*(dtheta1 + dtheta2), 0];
               [ - 3/10*sin(theta1 + theta2)*(dtheta1 + dtheta2) - 2/5*dtheta1*sin(theta1), -3/10*sin(theta1 + theta2)*(dtheta1 + dtheta2), 0];
           [                                                 0,                              0, 0];
           [                                                 0,                              0, 0];
           [                                                 0,                              0, 0];
           [                                                 0,                              0, 0]];
       
    dJA = double(dJA);
end