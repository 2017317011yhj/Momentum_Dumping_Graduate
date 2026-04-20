close all;
clc;

Earth_R = 6371.8*1000;
time = out.tout;
statvec = out.statvec_Mode3;
kep = out.kep_Mode3;

pos = statvec(:,1:3);
vel = statvec(:,4:6);
vel = (vel./vecnorm(vel')')*5000000;
axis_max = max(vecnorm(pos'))+1000000;

figure;
quiver3(0,0,0,axis_max,0,0,'r'); % ECI X axis
hold on; grid on;
quiver3(0,0,0,0,axis_max,0,'g'); % ECI Y axis
quiver3(0,0,0,0,0,axis_max,'b'); % ECI Z axis
xlabel('ECI_X [m]','FontSize',15);
ylabel('ECI_Y [m]','FontSize',15);
zlabel('ECI_Z [m]','FontSize',15);

% % sat position [m] wrt ECI
sat_pos = plot3(pos(1,1),pos(1,2),pos(1,3),'r.','MarkerSize',20);
axis equal;
axis([-axis_max axis_max -axis_max axis_max -axis_max axis_max]);

% % sat velocity [m/s] on position wrt ECI
sat_vel = quiver3(pos(1,1),pos(1,2),pos(1,3),vel(1,1),vel(1,2),vel(1,3),'r');

% % draw total trajectory wrt ECI
plot3(pos(:,1),pos(:,2),pos(:,3),'k-');

% % draw trajectory dt step wrt ECI
for i=1:1000:length(time)
    % update sat postion [m]
    set(sat_pos,'XData',pos(i,1),'YData',pos(i,2),'ZData',pos(i,3));
    % update sat velocity on postion [m]
    set(sat_vel,'XData',pos(i,1),'YData',pos(i,2),'ZData',pos(i,3),...
                'UData',vel(i,1),'VData',vel(i,2),'WData',vel(i,3));
    % update simulation time display
    str = sprintf('Time[sec] : %.2f\n POS[km]:%6.2f|%6.2f|%6.2f\n VEL[km/s]:%.2f|%.2f|%.2f',...
        time(i),pos(i,1)/1000,pos(i,2)/1000,pos(i,3)/1000,vel(i,1)/1000,vel(i,2)/1000,vel(i,3)/1000);
    title(str, 'FontSize',20);
    pause(0.01);
end

