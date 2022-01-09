function [TA, Tphi] = getTransformAnalytical(angle)


    Tphi = [0 -sin(angle(1)) cos(angle(1))*sin(angle(2));
            0  cos(angle(1)) sin(angle(1))*sin(angle(2));
            1       0             cos(angle(2))     ];

    TA = [eye(3)   zeros(3);
          zeros(3)   Tphi  ];
end