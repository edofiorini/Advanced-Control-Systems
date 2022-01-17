%% Plot force

figure(2);

subplot(3,2,1);
plot(out.he.Time',out.he.Data(:,1)', 'LineWidth',1.8);
title('x');xlabel('Time'); 


subplot(3,2,3);
plot(out.he.Time',out.he.Data(:,2)', 'LineWidth',1.8);
title('y');xlabel('Time'); 


subplot(3,2,5);
plot(out.he.Time',out.he.Data(:,3)', 'LineWidth',1.8);
title('z');xlabel('Time'); 


subplot(3,2,2);
plot(out.he.Time',out.he.Data(:,4)', 'LineWidth',1.8);
title('phi');xlabel('Time'); 


subplot(3,2,4);
plot(out.he.Time',out.he.Data(:,5)', 'LineWidth',1.8);
title('theta');xlabel('Time(s)'); ylabel('q2 (rad)');


subplot(3,2,6);
plot(out.he.Time',out.he.Data(:,6)', 'LineWidth',1.8);
title('psi');xlabel('Time'); 
