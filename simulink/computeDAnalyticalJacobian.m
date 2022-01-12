function [dJa] = computeDAnalyticalJacobian(Ja, q, dq)
        
          
        % derivative of Ja function of time, using the time simbolics (timeq/dtimeq) and then
        % going back to the symbolics (q/dq)
       
        % position parameters
        t = sym('t', 'real');
        timeq = [symfun('theta1(t)', t);
                symfun('theta2(t)', t);
                symfun('d3(t)', t)];

        % velocity parameters
        dtimeq = diff(timeq);
        
        timeJA = subs(Ja, q, timeq);
        dtimeJA = diff(timeJA);
        dJa = simplify(subs(dtimeJA, [dtimeq; timeq], [dq; q]));
end

