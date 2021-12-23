%% Plot the pose

figure(1);

subplot(3,1,1);
plot(out.q1.Time',out.q1.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.q1.Time',out.q1.Data(:,2)', 'LineWidth',1.8);
title('q1');xlabel('Time'); ylabel('rad');
legend('q1', 'q1d')

subplot(3,1,2);
plot(out.q2.Time',out.q2.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.q2.Time',out.q2.Data(:,2)', 'LineWidth',1.8);
title('q2');xlabel('Time'); ylabel('rad');
legend('q2', 'q2d')

subplot(3,1,3);
plot(out.q3.Time',out.q3.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.q3.Time',out.q3.Data(:,2)', 'LineWidth',1.8);
title('q3');xlabel('Time'); ylabel('rad');
legend('q3', 'q3d')