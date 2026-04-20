close all;
clc;


Earth_R = 6371.8*1000;
time = out.tout;
statvec = out.statvec;
% kep  = out.kep_Mode2;
% kep0 = out.kep0_Mode2;

pos = statvec(:,1:3);
vel = statvec(:,4:6);
vel = (vel./vecnorm(vel')')*5000000;
axis_max = max(vecnorm(pos'))+1000000;

figure;
quiver3(0,0,0,axis_max,0,0,'k','LineWidth',2); % ECI X axis
hold on; grid on;
quiver3(0,0,0,0,axis_max,0,'k','LineWidth',2); % ECI Y axis
quiver3(0,0,0,0,0,axis_max,'k','LineWidth',2); % ECI Z axis
plot3(pos(:,1),pos(:,2),pos(:,3),'k-');
axis equal;
% axis([min(pos(:,1)) max(pos(:,1)) min(pos(:,2)) max(pos(:,2)) min(pos(:,3)) max(pos(:,3))]);
sat_pos_hlr = plot3(pos(1,1),pos(1,2),pos(1,3),'k.','MarkerSize',30);

xlabel('ECI_X [m]','FontSize',15);
ylabel('ECI_Y [m]','FontSize',15);
zlabel('ECI_Z [m]','FontSize',15);

for i=1:100:length(time)

    set(sat_pos_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3));
    pause(0.001);
end

