function [Pli] = computePCoM(R, P, link, h, joints)

    % Compute the centre of mass respect the base frame
    if joints(link) == 'R'
        
        Pli = R(1:3, 3*link + 1: 3*link+3)*[-h/2; 0; 0] + P(1:3, link+1);
    
    else 
        
        Pli = R(1:3, 3*link + 1: 3*link+3)*[0; 0; -h/2] + P(1:3, link+1);
    end
    
    Pli = simplify(Pli);
end

