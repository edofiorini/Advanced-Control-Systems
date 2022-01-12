%% Plot the pose -- regulation problem

xD = [];
yD = [];
zD = [];
phiD = [];
thetaD = [];
psiD = [];

for i = 1:size(out.x.Time)
    
    xD = [xD, out.xd.Data(1)];
    yD = [yD, out.xd.Data(2)];
    zD = [zD, out.xd.Data(3)];
    phiD = [phiD, out.xd.Data(4)];
    thetaD = [thetaD, out.xd.Data(5)];
    psiD = [psiD, out.xd.Data(6)];
    
end

figure(1);

subplot(3,2,1);
plot(out.x.Time',out.x.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.x.Time',xD, 'LineWidth',1.8);
title('x');xlabel('Time'); 
legend('x', 'xd')

subplot(3,2,3);
plot(out.x.Time',out.x.Data(:,2)', 'LineWidth',1.8);
hold on
plot(out.x.Time',yD, 'LineWidth',1.8);
title('y');xlabel('Time'); 
legend('y', 'yd')

subplot(3,2,5);
plot(out.x.Time',out.x.Data(:,3)', 'LineWidth',1.8);
hold on
plot(out.x.Time',zD, 'LineWidth',1.8);
title('z');xlabel('Time'); 
legend('z', 'zd')

subplot(3,2,2);
plot(out.x.Time',out.x.Data(:,4)', 'LineWidth',1.8);
hold on
plot(out.x.Time',phiD, 'LineWidth',1.8);
title('phi');xlabel('Time'); 
legend('phi', 'phid')

subplot(3,2,4);
plot(out.x.Time',out.x.Data(:,5)', 'LineWidth',1.8);
hold on
plot(out.x.Time',thetaD, 'LineWidth',1.8);
title('theta');xlabel('Time'); 
legend('theta', 'thetad')

subplot(3,2,6);
plot(out.x.Time',out.x.Data(:,6)', 'LineWidth',1.8);
hold on
plot(out.x.Time',psiD, 'LineWidth',1.8);
title('psi');xlabel('Time'); 
legend('psi', 'psid')

%% Plot the pose -- Tracking problem

xD = [];
yD = [];
zD = [];
phiD = [];
thetaD = [];
psiD = [];

for i = 1:size(out.x.Time)
    
    xD = [xD, out.xd.Data(1,1,i)];
    yD = [yD, out.xd.Data(2,1,i)];
    zD = [zD, out.xd.Data(3,1,i)];
    phiD = [phiD, out.xd.Data(4, 1,i)];
    thetaD = [thetaD, out.xd.Data(5, 1,i)];
    psiD = [psiD, out.xd.Data(6,1,i)];
    
end

figure(1);

subplot(3,2,1);
plot(out.x.Time',out.x.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.x.Time',xD, 'LineWidth',1.8);
title('x');xlabel('Time'); 
legend('x', 'xd')

subplot(3,2,3);
plot(out.x.Time',out.x.Data(:,2)', 'LineWidth',1.8);
hold on
plot(out.x.Time',yD, 'LineWidth',1.8);
title('y');xlabel('Time'); 
legend('y', 'yd')

subplot(3,2,5);
plot(out.x.Time',out.x.Data(:,3)', 'LineWidth',1.8);
hold on
plot(out.x.Time',zD, 'LineWidth',1.8);
title('z');xlabel('Time'); 
legend('z', 'zd')

subplot(3,2,2);
plot(out.x.Time',out.x.Data(:,4)', 'LineWidth',1.8);
hold on
plot(out.x.Time',phiD, 'LineWidth',1.8);
title('phi');xlabel('Time'); 
legend('phi', 'phid')

subplot(3,2,4);
plot(out.x.Time',out.x.Data(:,5)', 'LineWidth',1.8);
hold on
plot(out.x.Time',thetaD, 'LineWidth',1.8);
title('theta');xlabel('Time'); 
legend('theta', 'thetad')

subplot(3,2,6);
plot(out.x.Time',out.x.Data(:,6)', 'LineWidth',1.8);
hold on
plot(out.x.Time',psiD, 'LineWidth',1.8);
title('psi');xlabel('Time'); 
legend('psi', 'psid')