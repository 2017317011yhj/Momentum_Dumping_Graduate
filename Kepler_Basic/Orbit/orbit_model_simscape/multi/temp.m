close all;
clc;

SS_state = out.ss_state;
TS_state = out.ts_state;
SS_rel_pos_mea = out.rel_pos_mea;

SS_pos = SS_state(:,1:3);
SS_vel = SS_state(:,4:6);
SS_acc = SS_state(:,7:9);
TS_pos = TS_state(:,1:3);
TS_vel = TS_state(:,4:6);
TS_acc = TS_state(:,7:9);
time   = out.tout;

figure;
plot3(0,0,0,'k.','MarkerSize',20);
hold on; grid on;
plot3(SS_pos(:,1),SS_pos(:,2),SS_pos(:,3),'k-','LineWidth',2);
plot3(TS_pos(:,1),TS_pos(:,2),TS_pos(:,3),'r-','LineWidth',2);
plot3(SS_rel_pos_mea(:,1),SS_rel_pos_mea(:,2),SS_rel_pos_mea(:,3),'m-','LineWidth',2);
SS_pos_hlr = plot3(SS_pos(1,1),SS_pos(1,2),SS_pos(1,3),'k.','MarkerSize',30);
TS_pos_hlr = plot3(TS_pos(1,1),TS_pos(1,2),TS_pos(1,3),'r.','MarkerSize',30);
axis equal;
hold off;

for i=1:100:length(time)
    set(SS_pos_hlr, 'XData', SS_pos(i,1), 'YData', SS_pos(i,2), 'ZData', SS_pos(i,3))
    set(TS_pos_hlr, 'XData', TS_pos(i,1), 'YData', TS_pos(i,2), 'ZData', TS_pos(i,3))

%     axis([SS_pos(i,1)-20 SS_pos(i,1)+20 ...
%           SS_pos(i,2)-20 SS_pos(i,2)+20 ...
%           SS_pos(i,3)-20 SS_pos(i,3)+20]);
%     drawnow;
    pause(0.001);    
    str = sprintf('time : %.2f', time(i,1));
    title(str);
end


% figure;
% plot3(0,0,0,'k.','MarkerSize',30);
% hold on; grid on;
% plot3(SS_pos(:,1), SS_pos(:,2), SS_pos(:,3), 'r-', 'LineWidth', 2 );
% plot3(TS_pos(:,1), TS_pos(:,2), TS_pos(:,3), 'b-', 'LineWidth', 2 );
% axis equal;
% SS_pos_hlr = plot3(SS_pos(1,1), SS_pos(1,2), SS_pos(1,3), 'r.', 'MarkerSize', 30);
% TS_pos_hlr = plot3(TS_pos(1,1), TS_pos(1,2), TS_pos(1,3), 'b.', 'MarkerSize', 30);
% 
% for i=1:50:length(time)
%     set(SS_pos_hlr, 'XData', SS_pos(i,1), 'YData', SS_pos(i,2), 'ZData', SS_pos(i,3))
%     set(TS_pos_hlr, 'XData', TS_pos(i,1), 'YData', TS_pos(i,2), 'ZData', TS_pos(i,3))
% 
%     axis([SS_pos(i,1)-20 SS_pos(i,1)+20 ...
%           SS_pos(i,2)-20 SS_pos(i,2)+20 ...
%           SS_pos(i,3)-20 SS_pos(i,3)+20]);
%     drawnow;
%     pause(0.001);    
%     str = sprintf('time : %.2f', time(i,1));
%     title(str);
% end
% axis([-5 5 -5 5 -5 5]);
