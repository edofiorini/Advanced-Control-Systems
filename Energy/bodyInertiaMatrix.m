function [I] = bodyInertiaMatrix(Ic, joints, link, m, a, h)
        
    % Translation respect the frame attached to the joint
    
    if joints(link) == 'P'
        % cube
        I = Ic + m*([0 0 -a/2]*[0; 0; -a/2;]*eye(3,3) - [0; 0; -a/2;]*[0; 0; -a/2]');
    else
        % cylinder 
        I = Ic + m*([-h/2 0 0]*[-h/2; 0; 0;]*eye(3,3) - [-h/2; 0; 0;]*[-h/2; 0; 0]');
    end
    
    I = simplify(I);
end

