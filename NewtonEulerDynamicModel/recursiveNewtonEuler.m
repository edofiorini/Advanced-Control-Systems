function [tau] = recursiveNewtonEuler(dq, ddq, B)
    
    dh;
    defineMechanicalParameters;
    if B == 0
        g0 = [0;0;0];
    end
    [directkinematicsManualS,P, Z, R, TJ01, RH, PH] = directKinematics(dhTable);
    
    z0 = [0; 0; 1];

    % FORWARD 

    r = sym(zeros(3, dof + 1));
    r_i_CoM = sym(zeros(3, dof + 1));  
    
    % add a zero due to matlab index
    Kr = [0, kr];
    zm = [zeros(3, 1), zm];
    dq = [0; dq];
    ddq = [0; ddq];
    
    ddpC = sym(zeros(3, dof + 1));
    dwm = sym(zeros(3, dof + 1));
    
    w = sym(zeros(3, dof + 1));
    dw = sym(zeros(3, dof + 1));
    ddp = sym(zeros(3, dof + 1));
    
    % frame 0 values -- initial conditions
    w(:, 1) = initialConditionsF(:,1);
    dw(:, 1) = initialConditionsF(:,2);
    ddp(:, 1) = initialConditionsF(:,3) + g0;

 
    for i= 2:dof+1  % Starting from 2 due to matlab indexing
        
        % precomputations
        R_previous = RH(:,:,i-1);  % from i-1 to i
        r(:, i) = simplify(R_previous'*PH(:,:, i-1));
        r_i_CoM(:, i) = computePCoMLocal(i-1, lengthOfLink(i - 1), joints);
    
        if joints(i-1) == 'R'
            w(:, i) = R_previous'*w(:, i-1) + R_previous'*dq(i)*z0;
            dw(:, i) = R_previous'*dw(:, i-1) + R_previous'*(ddq(i)*z0 + dq(i)*cross(w(:, i-1),z0));
            ddp(:, i) = R_previous'*ddp(:, i-1) + cross(dw(:, i), r(:, i)) + cross(w(:, i), cross(w(:, i), r(:, i)));
        else
            w(:, i) = R_previous'*w(:, i-1);
            dw(:, i) = R_previous'*dw(:, i-1);
            ddp(:, i) = R_previous'*ddp(:, i-1) + cross(dw(:, i), r(:, i)) + cross(w(:, i), cross(w(:, i), r(:, i))) + R_previous'*ddq(i)*z0 + 2*dq(i)*cross(w(:, i), R_previous'*z0);  
        end
            ddpC(:, i) = ddp(:, i) + cross(dw(:, i), r_i_CoM(:, i)) + cross(w(:, i), cross(w(:, i), r_i_CoM(:, i)));
            dwm(:, i) = dw(:, i-1) + Kr(i)*ddq(i)*zm(:, i) + Kr(i)*dq(i)*cross(w(:, i-1), zm(:, i));
    end
    
    % BACKWARD 

    f = zeros([3, dof + 1], 'sym');
    mu = zeros([3, dof + 1], 'sym');
    tau = zeros([dof, 1], 'sym');

    % frame n+1 values 
    f(:,dof + 1) = initialConditionsB(:,1);
    mu(:,dof + 1) = initialConditionsB(:,2);


    % delete first column because it is useless 
    w = w(:, 2:end);
    dw = dw(:, 2:end);
    ddpC = ddpC(:, 2:end);
    dwm = dwm(:, 2:end);
    r = r(:, 2:end);
    r_i_CoM = r_i_CoM(:, 2:end);
    % append a fake value at the end for link/motor
    dq = [dq; 0];
    ddq = [ddq; 0];
    Im = [Im, 0];
    Kr = [kr, 0];
    zm = [zm, zeros(3, 1)];

    
    for i= dof:-1:1
        % precomputations
        
        R_previous = RH(:,:,i);  % from i-1 to i
        R_next = RH(:,:,i+1);  % from i to i+1
        mi = parameters(i,5);
        [Ic] = bodyInertiaMatrixCoM(joints, i, parameters(i,1), parameters(i,2), parameters(i,3), parameters(i,4), parameters(i,5));
        [Iaug] = bodyInertiaMatrix(Ic, joints, i ,parameters(i,5), parameters(i,1), parameters(i,4));
    
        
        f(:, i) = R_next*f(:, i+1) + mi*ddpC(:, i);
        mu(:, i) = - cross(f(:, i), r(:, i) + r_i_CoM(:, i)) + R_next*mu(:, i+1) + cross(R_next*f(:, i+1), r_i_CoM(:, i)) + Iaug*dw(:, i) + cross(w(:, i), Iaug*w(:, i)) ... 
                    + Kr(i+1)*ddq(i+1)*Im(i+1)*zm(:, i+1) + Kr(i+1)*dq(i+1)*Im(i+1)*cross(w(:, i), zm(:, i+1));
        f(:, i) = simplify(f(:, i));
        mu(:, i) = simplify(mu(:, i));
           
        % get generalized torques 
        if joints(i) == 'R' 
            tau(i) = mu(:, i)'*R_previous'*z0 + Kr(i)*Im(i)*dwm(:, i)'*zm(:, i) + Fv(i, i)*dq(i) + Fs(i, i)*sign(dq(i));
        else
           tau(i) = f(:, i)'*R_previous'*z0 + Kr(i)*Im(i)*dwm(:, i)'*zm(:, i) + Fv(i, i)*dq(i) + Fs(i, i)*sign(dq(i));
        end
        tau(i) = simplify(tau(i));
    end
    
end

