%% Plot the pose

figure(1);

subplot(3,1,1);
plot(out.x.Time',out.x.Data(:,1)', 'LineWidth',1.8);
title('x');xlabel('Time');

subplot(3,1,2);
plot(out.x.Time',out.x.Data(:,2)', 'LineWidth',1.8);
title('y');xlabel('Time');

subplot(3,1,3);
plot(out.x.Time',out.x.Data(:,3)', 'LineWidth',1.8);
title('z');xlabel('Time');