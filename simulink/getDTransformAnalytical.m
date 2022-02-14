function [d_Ta, dT] = getDTransformAnalytical(angle, dangle)

phi = angle(1);
theta = angle(2);

phi_dot = dangle(1);
theta_dot = dangle(2);

% %first
% dTA = [[0, 0, 0,                                                                                0,                                                                                 0, 0];
%         [0, 0, 0,                                                                                0,                                                                                 0, 0];
%         [0, 0, 0,                                                                                0,                                                                                 0, 0];
%         [0, 0, 0,       -(2*theta_dot*cos(phi) + phi_dot*sin(2*theta)*sin(phi))/(cos(2*theta) - 1),        -(2*theta_dot*sin(phi) - phi_dot*sin(2*theta)*cos(phi))/(cos(2*theta) - 1), 0];
%         [0, 0, 0,                                                                -phi_dot*cos(phi),                                                                 -phi_dot*sin(phi), 0];
%         [0, 0, 0, (theta_dot*cos(phi)*cos(theta) + phi_dot*sin(phi)*sin(theta))/(cos(theta)^2 - 1), -(phi_dot*cos(phi)*sin(theta) - theta_dot*cos(theta)*sin(phi))/(cos(theta)^2 - 1), 0];];
    
%     % second
%  dTA = [[0, 0, 0,                                                                                0,                                                                                 0, 0];
%         [0, 0, 0,                                                                                0,                                                                                 0, 0];
%         [0, 0, 0,                                                                                0,                                                                                 0, 0];
%         [0, 0, 0,          (2*theta_dot*cos(phi) + phi_dot*sin(2*theta)*sin(phi))/(2*sin(theta)^2),           (2*theta_dot*sin(phi) - phi_dot*sin(2*theta)*cos(phi))/(2*sin(theta)^2), 0];
%         [0, 0, 0,                                                                -phi_dot*cos(phi),                                                                 -phi_dot*sin(phi), 0];
%         [0, 0, 0, (theta_dot*cos(phi)*cos(theta) + phi_dot*sin(phi)*sin(theta))/(cos(theta)^2 - 1), -(phi_dot*cos(phi)*sin(theta) - theta_dot*cos(theta)*sin(phi))/(cos(theta)^2 - 1), 0];];
%  
 
dT = [ [0, -phi_dot*cos(phi), theta_dot*cos(phi)*cos(theta) - phi_dot*sin(phi)*sin(theta)];
        [ 0, -phi_dot*sin(phi), phi_dot*cos(phi)*sin(theta) + theta_dot*cos(theta)*sin(phi)];
        [ 0,                 0,                                       -theta_dot*sin(theta)];];
    
 d_Ta = [zeros(3,6); 
        zeros(3,3), dT];
end