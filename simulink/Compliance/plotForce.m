%% Plot force

figure(2);

subplot(3,2,1);
plot(out.he.Time',out.he.Data(:,1)', 'LineWidth',1.8);
title('x');xlabel('Time'); 
legend('x')

subplot(3,2,3);
plot(out.he.Time',out.he.Data(:,2)', 'LineWidth',1.8);
title('y');xlabel('Time'); 
legend('y')

subplot(3,2,5);
plot(out.he.Time',out.he.Data(:,3)', 'LineWidth',1.8);
hold on
plot(out.he.Time', 0.5*ones(1, size(out.he.Time, 1)))
title('z');xlabel('Time'); 
legend('z', 'plane')

subplot(3,2,2);
plot(out.he.Time',out.he.Data(:,4)', 'LineWidth',1.8);
title('phi');xlabel('Time'); 
legend('phi')

subplot(3,2,4);
plot(out.he.Time',out.he.Data(:,5)', 'LineWidth',1.8);
title('theta');xlabel('Time'); 
legend('theta')

subplot(3,2,6);
plot(out.he.Time',out.he.Data(:,6)', 'LineWidth',1.8);
title('psi');xlabel('Time'); 
legend('psi')