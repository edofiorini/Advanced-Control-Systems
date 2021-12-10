function [B] = intertialMatrix(nlinks, joints, parameters, dhTable, lengthOfLink)
        
        B = zeros(3, 'sym');

        for link = 1:nlinks

            [Ic] = bodyInertiaMatrixCoM(joints, link, parameters(link,1), parameters(link,2), parameters(link,3), parameters(link,4), parameters(link,5));
            [I] = bodyInertiaMatrix(Ic, joints,link,parameters(link,5), parameters(link,1), parameters(link,4));

            [partialGeoJacobian, R] = partialGeometricJacobian(dhTable,joints, link, lengthOfLink);
            B = B + parameters(link,5)*partialGeoJacobian(1:3,:)'*partialGeoJacobian(1:3,:) + partialGeoJacobian(4:6,:)'*R(1:3,3*link+1:3*link+3)*I*R(1:3,3*link+1:3*link+3)'*partialGeoJacobian(4:6,:);
            B = simplify(B);
        end
        
end

