close all;
clc;

Target_State   = out.Target_Statevec;
Target_Pos     = Target_State(:,1:3);
Target_Vel     = Target_State(:,4:6);
Service_Pos    = out.sevice_Pos_relative;
time = out.tout;


figure;
plot3(0,0,0,'k.','MarkerSize',30);
hold on; grid on;
plot3(Service_Pos(:,1), Service_Pos(:,2), Service_Pos(:,3), 'r-', 'LineWidth', 2 );
axis equal;
service_pos_hlr = plot3(Service_Pos(1,1), Service_Pos(1,2), Service_Pos(1,3), 'b.', 'MarkerSize', 30);

for i=1:50:length(time)
    set(service_pos_hlr, 'XData', Service_Pos(i,1), 'YData', Service_Pos(i,2), 'ZData', Service_Pos(i,3))
    drawnow;
    pause(0.001);
end
% axis([-5 5 -5 5 -5 5]);
