function [B] = getBLagrangian(q)

    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);
    

    % wrt frame 0
    B = [[ (759613*pi)/18750000 + (813*cos(theta2))/5000 + (2439*pi*((36*cos(theta2))/25 + 102027/40000))/160000 + 650671/3840000, (813*cos(theta2))/10000 + (2439*pi*((18*cos(theta2))/25 + 25227/40000))/160000 + 46883/768000,       0];
        [                          (813*cos(theta2))/10000 + (2439*pi*((18*cos(theta2))/25 + 25227/40000))/160000 + 46883/768000,                                               (61528653*pi)/6400000000 + 46883/768000,               0];
        [                                                                                                              0,                                                                                     0,                271/400]];
 
    

 
    B = double(B);
end