function G = getGLagrangian(q)

    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);
    g = 9.81;
    
    G = [- (1248833220191889*cos(theta1 + theta2))/439804651110400 - (66728601907445299*cos(theta1))/8796093022208000;
                                         -(6394026087382471551*cos(theta1 + theta2))/2251799813685248000;
                                                                                               0  ];                                                                                           

    G = double(G);
end