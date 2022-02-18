function [JA] = getAnalyticalJacobian(q)

    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);

    % wrt frame 0
    JA = [[- (2*sin(theta1))/5 - (3*cos(theta1)*sin(theta2))/10 - (3*cos(theta2)*sin(theta1))/10, - (3*cos(theta1)*sin(theta2))/10 - (3*cos(theta2)*sin(theta1))/10, 0];
          [  (2*cos(theta1))/5 + (3*cos(theta1)*cos(theta2))/10 - (3*sin(theta1)*sin(theta2))/10,   (3*cos(theta1)*cos(theta2))/10 - (3*sin(theta1)*sin(theta2))/10, 0];
          [                                                                0,                                                 0, 1];
          [                                                                1,                                                 1, 0];
          [                                                                0,                                                 0, 0];
          [                                                                0,                                                 0, 0];];
  


  JA = double(JA);

end