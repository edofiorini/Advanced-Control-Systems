function [C] = getCHatLagrangian(q, dq)

    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);
    
    dtheta1 = dq(1);
    dtheta2 = dq(2);
    dd3 = dq(3);
    
    % density (aluminum)
    density = 2710; % [kg/m^3]

    %base link
    link0h = 0.4;   % [m]
    link0a = 0.025; % [m]
    link0V = pi * link0a^2 * link0h; % [m^3]
    link0m = density * link0V;        % [kg]
 
    % link 1
    link1h = 0.4; %0.16;   % [m]
    link1a = 0.020; % [m]
    link1b = 0;%0.01;
    link1V = pi * link1a^2 * link1h; % [m^3]
    link1m = density * link1V;        % [kg]
 
    % link 2
    link2h = 0.3;   % [m]
    link2a = 0.015; % [m]
    link2b = 0;%0.0075;
    link2V = pi * link2a^2 * link2h; % [m^3]
    link2m = density * link2V;        % [kg]
 
    % link 3
    link3a = 0.4;   % [m]
    link3b = 0.025; % [m]
    link3c = 0.025; % [m]
    link3V = link3b * link3c * link3a; % [m^3]
    link3m = density * link3V;   % [kg]
 
    a1 = 0.4;
    a2 = 0.3;
    l3 = 0.4;

    C = [[-(a1*a2*dtheta2*sin(theta2)*(link2m + 2*link3m))/2, -(a1*a2*sin(theta2)*(dtheta1 + dtheta2)*(link2m + 2*link3m))/2, 0];
         [ (a1*a2*dtheta1*sin(theta2)*(link2m + 2*link3m))/2,                                                  0, 0];
         [                                         0,                                                  0, 0];];
 

    C = double(C);
end