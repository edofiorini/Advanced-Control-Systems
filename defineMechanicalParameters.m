% This script defines all the parameters of the robot

syms link0h link0a link0V link0m link1h link1a link1b link1c link1V link1m link2h link2a link2b link2c link2V link2m link3a link3b link3c link3h link3V link3m f1 f2 f3 mu1 mu2 mu3  phi psii 'real' 

 % a b c h m
 parameters = [ link1a,  link1b,  0,      a1,  link1m
                link2a,  link2b,  0,      a2,  link2m 
                l3,  link3b,  link3c, 0,       link3m  ];

lengthOfLink = [a1 a2 l3];
            
joints = ["R", "R" ,"P"];
nlinks = 3;

% Gravity definition
g = 9.81;
g0 = [0;-g;0];


% inertial value of i-th motor over the z-axis (assuming symmetry of motor)
Im = zeros(1, dof, 'sym'); % = sym('Im', [1, dof], 'positive');

% gear rateos
kr = zeros(1, dof, 'sym'); % = sym('Kr', [1, this.dofs], 'positive');

% motor rotation axis w.r.t. its link (motor i is attached to link i-1)
zm = sym([[0; 0; 1],[0; 0; 1],[0; 0; 1]]); % = sym('zm', [3, this.dofs], 'real');

% viscous and static frictions of each link
Fv = zeros(dof, 'sym'); %diag(sym('Fv', [this.dofs,1], 'positive'));
Fs = zeros(dof, 'sym'); %diag(sym('Fv', [this.dofs,1], 'positive'));
            
%Initial conditions for forward NE
initialConditionsF = [[0; 0; 0;], [0; 0; 0;], [0; 0; 0;]];

%Initial conditions for inverse NE
initialConditionsB = [[f1; f2; f3;], [mu1; mu2; mu3;]];

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




