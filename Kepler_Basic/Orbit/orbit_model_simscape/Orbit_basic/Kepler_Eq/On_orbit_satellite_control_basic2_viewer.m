close all;
clc;

Earth_R = 6371.8*1000;
time    = out.tout;
statvec = out.statvec;
AXIS_ECEF_X = out.ECEF_vecX;
AXIS_ECEF_Y = out.ECEF_vecY;
AXIS_ECEF_Z = out.ECEF_vecZ;
AXIS_ECI_X  = out.ECI_vecX;
AXIS_ECI_Y  = out.ECI_vecY;
AXIS_ECI_Z  = out.ECI_vecZ;
AXIS_LVLH_X = out.LVLH_vecX;
AXIS_LVLH_Y = out.LVLH_vecY;
AXIS_LVLH_Z = out.LVLH_vecZ;

pos = statvec(:,1:3);% wrt ECI
vel = statvec(:,4:6);% wrt ECI
vel = (vel./vecnorm(vel')')*5000000;
axis_max = max(vecnorm(pos'))+1000000;

figure;
quiver3(0,0,0,AXIS_ECI_X(1,1),AXIS_ECI_X(1,2),AXIS_ECI_X(1,3),'k','LineWidth',2); % ECI X axis
hold on; grid on;
quiver3(0,0,0,AXIS_ECI_Y(1,1),AXIS_ECI_Y(1,2),AXIS_ECI_Y(1,3),'k','LineWidth',2); % ECI Y axis
quiver3(0,0,0,AXIS_ECI_Z(1,1),AXIS_ECI_Z(1,2),AXIS_ECI_Z(1,3),'k','LineWidth',2); % ECI Z axis
ECEF_X_hlr = quiver3(0,0,0,AXIS_ECEF_X(1,1),AXIS_ECEF_X(1,2),AXIS_ECEF_X(1,3),'r','LineWidth',2); % ECEF X axis
ECEF_Y_hlr = quiver3(0,0,0,AXIS_ECEF_Y(1,1),AXIS_ECEF_Y(1,2),AXIS_ECEF_Y(1,3),'r','LineWidth',2); % ECEF Y axis
ECEF_Z_hlr = quiver3(0,0,0,AXIS_ECEF_Z(1,1),AXIS_ECEF_Z(1,2),AXIS_ECEF_Z(1,3),'r','LineWidth',2); % ECEF Z axis
LVLH_X_hlr = quiver3(pos(1,1),pos(1,2),pos(1,3),AXIS_LVLH_X(1,1),AXIS_LVLH_X(1,2),AXIS_LVLH_X(1,3),'b','LineWidth',2); % LVLH X axis
LVLH_Y_hlr = quiver3(pos(1,1),pos(1,2),pos(1,3),AXIS_LVLH_Y(1,1),AXIS_LVLH_Y(1,2),AXIS_LVLH_Y(1,3),'b','LineWidth',2); % LVLH Y axis
LVLH_Z_hlr = quiver3(pos(1,1),pos(1,2),pos(1,3),AXIS_LVLH_Z(1,1),AXIS_LVLH_Z(1,2),AXIS_LVLH_Z(1,3),'b','LineWidth',2); % LVLH Z axis
plot3(pos(:,1), pos(:,2), pos(:,3), 'k-');
axis equal;
% axis([min(pos(:,1)) max(pos(:,1)) min(pos(:,2)) max(pos(:,2)) min(pos(:,3)) max(pos(:,3))]);
sat_pos_hlr = plot3(pos(1,1), pos(1,2), pos(1,3), 'k.', 'MarkerSize', 30);

xlabel('ECI_X [m]','FontSize',15);
ylabel('ECI_Y [m]','FontSize',15);
zlabel('ECI_Z [m]','FontSize',15);

for i=1:1000:length(time)

    set(sat_pos_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3));
    set(ECEF_X_hlr, 'UData', AXIS_ECEF_X(i,1), 'VData', AXIS_ECEF_X(i,2), 'WData', AXIS_ECEF_X(i,3));
    set(ECEF_Y_hlr, 'UData', AXIS_ECEF_Y(i,1), 'VData', AXIS_ECEF_Y(i,2), 'WData', AXIS_ECEF_Y(i,3));
    set(ECEF_Z_hlr, 'UData', AXIS_ECEF_Z(i,1), 'VData', AXIS_ECEF_Z(i,2), 'WData', AXIS_ECEF_Z(i,3));
    set(LVLH_X_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3), ...
                    'UData', AXIS_LVLH_X(i,1), 'VData', AXIS_LVLH_X(i,2), 'WData', AXIS_LVLH_X(i,3));
    set(LVLH_Y_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3), ...
                    'UData', AXIS_LVLH_Y(i,1), 'VData', AXIS_LVLH_Y(i,2), 'WData', AXIS_LVLH_Y(i,3));
    set(LVLH_Z_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3), ...
                    'UData', AXIS_LVLH_Z(i,1), 'VData', AXIS_LVLH_Z(i,2), 'WData', AXIS_LVLH_Z(i,3));

    pause(0.001);
end

