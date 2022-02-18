function [geoJacobian] = geometricJacobianManual(dhTable,joints)
    
    % Compute the geometric jacobian
    
    [directkinematicsManualS,P, Z] = directKinematics(dhTable);
    
    geoJacobianPos = [];
    geoJacobianOr = [];
    for i=2:size(Z,2)
        
        if joints(i-1) == 'R'
            geoJacobianPos = [geoJacobianPos, cross(Z(:,i-1),(P(:,end)-P(:,i-1)))];
            geoJacobianOr = [geoJacobianOr, Z(:,i-1)];
        else 
            geoJacobianPos = [geoJacobianPos,Z(:,i-1) ];
            geoJacobianOr = [geoJacobianOr, [0;0;0]];
        end
    end
    
    geoJacobian = [geoJacobianPos;geoJacobianOr ];
end

