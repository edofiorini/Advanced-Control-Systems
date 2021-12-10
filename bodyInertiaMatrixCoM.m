function [Ic] = bodyInertiaMatrixCoM(joints, link, a, b, c, h, m)


    if joints(link) == 'P'
        % cube
        Ic = [ 1/12*m*(b^2 + a^2)        0         0 
                0                1/12*m*(a^2 + c^2) 0
                0                         0          1/12*m*(b^2 + c^2)];
    
    else
        %cilinder 
        Ic = [1/12*m*(a^2 + b^2)          0                         0 
                0                1/12*m*(3*(a^2 + b^2) + h^2)   0
                0                         0                    1/12*m*(3*(a^2 + b^2) + h^2) ];
    end 
    
    Ic = simplify(Ic);
end

