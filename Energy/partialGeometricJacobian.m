function [partialGeoJacobian, R] = partialGeometricJacobian(dhTable,joints, link, lengthOfLink)
    
    % Compute the partial geometric jacobian

    [directkinematicsManualS,P, Z, R] = directKinematics(dhTable);
    [Pli] = computePCoM(R, P, link, lengthOfLink(link), joints);
    
    partialGeoJacobianPos = [];
    partialGeoJacobianOr = [];
    for i=2:(link+1)
        
        if joints(i-1) == 'R'
            partialGeoJacobianPos = [partialGeoJacobianPos, cross(Z(:,i),(Pli-P(:,i-1)))];
            partialGeoJacobianOr = [partialGeoJacobianOr, Z(:,i)];
        else 
            partialGeoJacobianPos = [partialGeoJacobianPos,Z(:,i) ];
            partialGeoJacobianOr = [partialGeoJacobianOr, [0;0;0]];
        end
    end
    
    partialGeoJacobian = [partialGeoJacobianPos;partialGeoJacobianOr];
    j = 4 - (link+1);
    for k=1:j
         partialGeoJacobian = [partialGeoJacobian, zeros(6,1)];
    end
    partialGeoJacobian = simplify(partialGeoJacobian);
end

