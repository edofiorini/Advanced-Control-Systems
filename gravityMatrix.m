function [G] = gravityMatrix(m, link, dhTable, joints, lengthOfLink, g0)
        
    
    
    [partialGeoJacobianLink1, R] = partialGeometricJacobian(dhTable, joints, 1, lengthOfLink);
    [partialGeoJacobianLink2, R] = partialGeometricJacobian(dhTable, joints, 2, lengthOfLink);
    [partialGeoJacobianLink3, R] = partialGeometricJacobian(dhTable, joints, 3, lengthOfLink);
    partialGeoJacobian = cat(3, partialGeoJacobianLink1(1:3,:), partialGeoJacobianLink2(1:3,:), partialGeoJacobianLink3(1:3,:));
    
    G = zeros([link, 1], 'sym');
    for i=1:link 
        gj = zeros([3, 1], 'sym');
        for j=1:link 
            JLjPi = partialGeoJacobian(:,i,j);
            gj = gj + m(j)*JLjPi;
        end
        G(i) = simplify(g0'*gj);
    end
        
end

