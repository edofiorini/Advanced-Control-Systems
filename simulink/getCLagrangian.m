function [C] = getCLagrangian(q, dq)

    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);
    
    dtheta1 = dq(1);
    dtheta2 = dq(2);
    dd3 = dq(3);

    C = [[-(6517865532499971*dtheta2*sin(theta2))/56294995342131200, -(6517865532499971*sin(theta2)*(dtheta1 + dtheta2))/56294995342131200, 0];
        [ (6517865532499971*dtheta1*sin(theta2))/56294995342131200,                                                         0,              0];
        [                                                0,                                                         0,                     0]];
 

    C = double(C);
end