%% Plot the pose

figure(1);
plot(out.q.Time',out.q.Data', 'LineWidth',1.8);
hold on
plot(out.qd.Time',out.qd.Data', 'LineWidth',1.8);
title('q');xlabel('Time'); ylabel('rad');
legend('q', 'qd')