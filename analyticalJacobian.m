function [Ja, Ta] = analyticalJacobian(J)
        
        % Analytical Jacobian starting from the geometric jacobian
        % Using the relation with the T matrix
        
        syms phi psii 'real'
        
        Ry = [cos(phi) 0 sin(phi); 0 1 0; -sin(phi) 0 cos(phi)];
        Rz = [cos(psii) -sin(psii) 0; sin(psii) cos(psii) 0; 0 0 1];

        p1 = [0 0 1]';
        p2 =  Rz * [0 1 0]';
        p3 =  (Rz*Ry) * [ 0 0 1]';

        T = [p1 p2 p3];
        Ta = [[eye(3,3), zeros(3,3)]; [zeros(3,3), T]];

        Ja = inv(Ta)*J;
end

