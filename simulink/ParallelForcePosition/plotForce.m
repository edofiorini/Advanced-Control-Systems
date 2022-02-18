%% Plot the force

figure(1);

subplot(3,1,1);
plot(out.f1.Time',out.f1.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.f1.Time',out.f1.Data(:,2)', 'LineWidth',1.8);
title('f1');xlabel('Time'); 
legend('f1', 'f1d')

subplot(3,1,2);
plot(out.f2.Time',out.f2.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.f2.Time',out.f2.Data(:,2)', 'LineWidth',1.8);
title('f2');xlabel('Time'); 
legend('f2', 'f2d')

subplot(3,1,3);
plot(out.f3.Time',out.f3.Data(:,1)', 'LineWidth',1.8);
hold on
plot(out.f3.Time',out.f3.Data(:,2)', 'LineWidth',1.8);
title('f3');xlabel('Time'); 
legend('f3', 'f3d')