%% Plot the pose

figure(1);
subplot(3,1,1)
plot(out.t1.Time',out.t1.Data(:,1), 'LineWidth',1.8);
hold on
plot(out.t1.Time',out.t1.Data(:,2), 'LineWidth',1.8);
title('t1');
legend('t1', 't1d')

subplot(3,1,2)
plot(out.t2.Time',out.t2.Data(:,1), 'LineWidth',1.8);
hold on
plot(out.t2.Time',out.t2.Data(:,2), 'LineWidth',1.8);
title('t2');
legend('t2', 't2d')

subplot(3,1,3)
plot(out.t3.Time',out.t3.Data(:,1), 'LineWidth',1.8);
hold on
plot(out.t3.Time',out.t3.Data(:,2), 'LineWidth',1.8);
title('t3');
legend('t3', 't3d')

