close all;
clc;

rad2deg = 180/pi;

t = out.tout;

ECI_LIN   = out.LIN_ECI;
Sat_Lat   = out.LLA(:,2);
Sat_Lon   = out.LLA(:,1);
Sat_Alt   = out.LLA(:,3);
ECI_vecX  = out.ECI_vecX;
ECI_vecY  = out.ECI_vecY;
ECI_vecZ  = out.ECI_vecZ;
ECEF_vecX = out.ECEF_vecX;
ECEF_vecY = out.ECEF_vecY;
ECEF_vecZ = out.ECEF_vecZ;
LVLH_vecX = out.LVLH_vecX;
LVLH_vecY = out.LVLH_vecY;
LVLH_vecZ = out.LVLH_vecZ;
BODY_vecX = out.BODY_vecX;
BODY_vecY = out.BODY_vecY;
BODY_vecZ = out.BODY_vecZ;
BODY_Nadir = out.body_nadir;

figure;

plot3(ECI_LIN(:,1),ECI_LIN(:,2),ECI_LIN(:,3),'k-', 'LineWidth', 3)
axis equal;
axis([ min(ECI_LIN(:,1))-1000000, max(ECI_LIN(:,1))+1000000, ...
       min(ECI_LIN(:,2))-1000000, max(ECI_LIN(:,2))+1000000, ...
       min(ECI_LIN(:,3))-5000000, max(ECI_LIN(:,3))+5000000 ])
hold on; grid on;
plot3(ECI_LIN(1,1),ECI_LIN(1,2),ECI_LIN(1,3),'r.','MarkerSize',40);

quiver3(0,0,0,ECI_vecX(1,1),ECI_vecX(1,2),ECI_vecX(1,3),'k');
quiver3(0,0,0,ECI_vecY(1,1),ECI_vecY(1,2),ECI_vecY(1,3),'k');
quiver3(0,0,0,ECI_vecZ(1,1),ECI_vecZ(1,2),ECI_vecZ(1,3),'k');

% % % % % % % % % % % % % % % % % % % % Handler % % % % % % % % % % % % % % % % % % % % % % % % % % % %
sat_pos_hadler = plot3(ECI_LIN(1,1),ECI_LIN(1,2),ECI_LIN(1,3),'b.','MarkerSize',40);

LVLH_X_handler = quiver3(ECI_LIN(1,1), ECI_LIN(1,2), ECI_LIN(1,3),...
    LVLH_vecX(1,1),   LVLH_vecX(1,2),   LVLH_vecX(1,3),'k','LineWidth',2);
LVLH_Y_handler = quiver3(ECI_LIN(1,1), ECI_LIN(1,2), ECI_LIN(1,3),...
    LVLH_vecY(1,1),   LVLH_vecY(1,2),   LVLH_vecY(1,3),'k','LineWidth',2);
LVLH_Z_handler = quiver3(ECI_LIN(1,1), ECI_LIN(1,2), ECI_LIN(1,3),...
    LVLH_vecZ(1,1),   LVLH_vecZ(1,2),   LVLH_vecZ(1,3),'k','LineWidth',2);

ECEF_X_handler = quiver3(0,0,0,...
    ECEF_vecX(1,1),   ECEF_vecX(1,2),   ECEF_vecX(1,3),'k','LineWidth',2);
ECEF_Y_handler = quiver3(0,0,0,...
    ECEF_vecY(1,1),   ECEF_vecY(1,2),   ECEF_vecY(1,3),'k','LineWidth',2);
ECEF_Z_handler = quiver3(0,0,0,...
    ECEF_vecZ(1,1),   ECEF_vecZ(1,2),   ECEF_vecZ(1,3),'k','LineWidth',2);

BODY_X_handler = quiver3(0,0,0,...
    BODY_vecX(1,1),   BODY_vecX(1,2),   BODY_vecX(1,3),'r','LineWidth',2);
BODY_Y_handler = quiver3(0,0,0,...
    BODY_vecY(1,1),   BODY_vecY(1,2),   BODY_vecY(1,3),'g','LineWidth',2);
BODY_Z_handler = quiver3(0,0,0,...
    BODY_vecZ(1,1),   BODY_vecZ(1,2),   BODY_vecZ(1,3),'b','LineWidth',2);


sat_line_handler = line([0 ECI_LIN(1,1)],[0 ECI_LIN(1,2)],[0 ECI_LIN(1,3)],'Color','black');

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
xlabel('ECI PosX [m]');
ylabel('ECI PosY [m]');
zlabel('ECI PosZ [m]');
view(0,90);

% writerObj = VideoWriter('E0_75.avi');
% writerObj.FrameRate = 60;
% open(writerObj);

for i=1:1:length(t)
    basic_title = sprintf('Time : %0.2f [sec]\n Lat:%3.2f, Lon:%3.2f, Alt:%f',...
        t(i,1),Sat_Lat(i,1)*rad2deg,Sat_Lon(i,1)*rad2deg,Sat_Alt(i,1)*0.001);
    title(basic_title);
%     quiver3(ECI_LIN(i,1),ECI_LIN(i,2),ECI_LIN(i,3),BODY_Nadir(i,1),BODY_Nadir(i,2),BODY_Nadir(i,1),'k');
    set(sat_pos_hadler, 'XData', ECI_LIN(i,1), ...
                        'YData', ECI_LIN(i,2), ...
                        'ZData', ECI_LIN(i,3));
    
    set(ECEF_X_handler, 'XData', 0, 'YData', 0, 'ZData', 0,...
                        'UData', ECEF_vecX(i,1), 'VData', ECEF_vecX(i,2), 'WData', ECEF_vecX(i,3));
    set(ECEF_Y_handler, 'XData', 0, 'YData', 0, 'ZData', 0,...
                        'UData', ECEF_vecY(i,1), 'VData', ECEF_vecY(i,2), 'WData', ECEF_vecY(i,3));
    set(ECEF_Z_handler, 'XData', 0, 'YData', 0, 'ZData', 0,...
                        'UData', ECEF_vecZ(i,1), 'VData', ECEF_vecZ(i,2), 'WData', ECEF_vecZ(i,3));

    set(sat_line_handler, 'XData', [0 ECI_LIN(i,1)], 'YData', [0 ECI_LIN(i,2)], 'ZData', [0 ECI_LIN(i,3)])
    set(LVLH_X_handler, 'XData', ECI_LIN(i,1), 'YData', ECI_LIN(i,2), 'ZData', ECI_LIN(i,3),...
                        'UData', LVLH_vecX(i,1), 'VData', LVLH_vecX(i,2), 'WData', LVLH_vecX(i,3));
    set(LVLH_Y_handler, 'XData', ECI_LIN(i,1), 'YData', ECI_LIN(i,2), 'ZData', ECI_LIN(i,3),...
                        'UData', LVLH_vecY(i,1), 'VData', LVLH_vecY(i,2), 'WData', LVLH_vecY(i,3));
    set(LVLH_Z_handler, 'XData', ECI_LIN(i,1), 'YData', ECI_LIN(i,2), 'ZData', ECI_LIN(i,3),...
                        'UData', LVLH_vecZ(i,1), 'VData', LVLH_vecZ(i,2), 'WData', LVLH_vecZ(i,3));

    set(BODY_X_handler, 'XData', ECI_LIN(i,1), 'YData', ECI_LIN(i,2), 'ZData', ECI_LIN(i,3),...
                        'UData', BODY_vecX(i,1), 'VData', BODY_vecX(i,2), 'WData', BODY_vecX(i,3));
    set(BODY_Y_handler, 'XData', ECI_LIN(i,1), 'YData', ECI_LIN(i,2), 'ZData', ECI_LIN(i,3),...
                        'UData', BODY_vecY(i,1), 'VData', BODY_vecY(i,2), 'WData', BODY_vecY(i,3));
    set(BODY_Z_handler, 'XData', ECI_LIN(i,1), 'YData', ECI_LIN(i,2), 'ZData', ECI_LIN(i,3),...
                        'UData', BODY_vecZ(i,1), 'VData', BODY_vecZ(i,2), 'WData', BODY_vecZ(i,3));

%     quiver3(ECI_LIN(i,1), ECI_LIN(i,2), ECI_LIN(i,3),...
%               BODY_vecX(i,1),   BODY_vecX(i,2),   BODY_vecX(i,3),'k','LineWidth',2);
%     quiver3(ECI_LIN(i,1), ECI_LIN(i,2), ECI_LIN(i,3),...
%               BODY_vecY(i,1),   BODY_vecY(i,2),   BODY_vecY(i,3),'k','LineWidth',2);
%     quiver3(ECI_LIN(i,1), ECI_LIN(i,2), ECI_LIN(i,3),...
%               BODY_vecZ(i,1),   BODY_vecZ(i,2),   BODY_vecZ(i,3),'k','LineWidth',2);
%     quiver3(ECI_LIN(i,1), ECI_LIN(i,2), ECI_LIN(i,3),...
%               LVLH_vecY(i,1),   LVLH_vecY(i,2),   LVLH_vecY(i,3),'k','LineWidth',2);
%     quiver3(ECI_LIN(i,1), ECI_LIN(i,2), ECI_LIN(i,3),...
%               LVLH_vecZ(i,1),   LVLH_vecZ(i,2),   LVLH_vecZ(i,3),'k','LineWidth',2);
% 
%     quiver3(ECI_LIN(i,1), ECI_LIN(i,2), ECI_LIN(i,3),...
%               BODY_vecX(i,1),   BODY_vecX(i,2),   BODY_vecX(i,3),'r','LineWidth',2);
%     quiver3(ECI_LIN(i,1), ECI_LIN(i,2), ECI_LIN(i,3),...
%               BODY_vecY(i,1),   BODY_vecY(i,2),   BODY_vecY(i,3),'g','LineWidth',2);
%     quiver3(ECI_LIN(i,1), ECI_LIN(i,2), ECI_LIN(i,3),...
%               BODY_vecZ(i,1),   BODY_vecZ(i,2),   BODY_vecZ(i,3),'b','LineWidth',2);

%     frame = getframe;
%     writeVideo(writerObj,frame);
    drawnow;
    pause((1/norm(ECI_LIN(i,4:6)))*100);
end

% 5733.3
% 1433.3