function [q1, q2, q3, dq1, dq2, dq3, ddq1, ddq2, ddq3, d0, a1, a2, l3, mu1, mu2, mu3, f1, f2, f3] = defineConfiguration()

    % Define robot configuration
    
    q1 = pi;
    q2 = 0;
    q3 = 0;
    
    dq1 = 0;
    dq2 = 0;
    dq3 = 0;
    
    ddq1 = 0;
    ddq2 = 0;
    ddq3 = 0;
    
    d0 = 0.4;
    a1 = 0.4;
    a2 = 0.3;
    l3 = 0.4;
   
    mu1 = 0;
    mu2 = 0;
    mu3 = 0;
    
    f1 = 0;
    f2 = 0;
    f3 = 0;
    
end

