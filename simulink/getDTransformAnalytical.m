function [d_Ta, dT] = getDTransformAnalytical(angle, dangle)

phi = angle(1);
theta = angle(2);

phi_dot = dangle(1);
theta_dot = dangle(2);

% ZYZ configuration 
dT = [ [0, -phi_dot*cos(phi), theta_dot*cos(phi)*cos(theta) - phi_dot*sin(phi)*sin(theta)];
        [ 0, -phi_dot*sin(phi), phi_dot*cos(phi)*sin(theta) + theta_dot*cos(theta)*sin(phi)];
        [ 0,                 0,                                       -theta_dot*sin(theta)];];
    
 d_Ta = [zeros(3,6); 
        zeros(3,3), dT];
end