%% Plot the pose

figure(1);

plot(out.torque.Time',out.torque.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.torque.Time',out.torque.Data(:,2)', 'LineWidth',1.8);
hold on
plot(out.torque.Time',out.torque.Data(:,3)', 'LineWidth',1.8);
title('Torque');
legend('theta1', 'theta2', 'd3')

