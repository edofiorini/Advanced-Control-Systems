function [PliL] = computePCoMLocal(link, h, joints)

    % Compute the centre of mass respect the local frame of the joint
    if joints(link) == 'R'
        
        PliL = [-h/2; 0; 0];
    
    else 
        
        PliL = [0; 0; -h/2];
    end
    
    PliL = simplify(PliL);
end

