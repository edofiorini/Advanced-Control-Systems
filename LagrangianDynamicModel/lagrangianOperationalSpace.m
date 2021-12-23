function [BA, CA, GA, yA] = lagrangianOperationalSpace()
    
        syms ddx ddy ddz ddph ddth ddps 'real'


        DDX = [ddx, ddy, ddz, ddph, ddth, ddps]';
         
        dh;
        
        q = [q1; q2; q3];
        dq = [dq1; dq2; dq3];
        ddq = [ddq1; ddq2; ddq3];
        tau = [tau1; tau2; tau3];
        defineMechanicalParameters;
        
        [J] = geometricJacobianManual(dhTable,joints);
        [Ja, Ta] = analyticalJacobian(J);
        [dJa] = dAnalyticalJacobian(Ja, q, dq);
       
      
        lagrangianDynamicModel;
        
        
        % the robot is non-redundant
       
        BA = simplify(pinv(Ja')*B*pinv(Ja));
        CA = simplify((pinv(Ja')*C - BA*dJa)*dq);
        GA = simplify(pinv(Ja')*G);
        yA = Ta'*pinv(J')*tau; % yA = TA'*ye  where  tau = J'*ye

        
        
        yA = BA*DDX + CA + GA;
        
end

