%% Plot the pose

figure(2);

subplot(3,1,1);
plot(out.x.Time',out.x.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.x.Time',out.x.Data(:,2)', 'LineWidth',1.8);
title('x');xlabel('Time'); 
legend('x', 'xd')

subplot(3,1,2);
plot(out.y.Time',zeros(1,size(out.y.Time',1)), 'LineWidth',1.8);
hold on
plot(out.y.Time',out.y.Data(:,2)', 'LineWidth',1.8);
title('y');xlabel('Time'); 
legend('y', 'yd')

subplot(3,1,3);
plot(out.z.Time',out.z.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.z.Time',out.z.Data(:,2)', 'LineWidth',1.8);
title('z');xlabel('Time'); 
legend('z', 'zd')