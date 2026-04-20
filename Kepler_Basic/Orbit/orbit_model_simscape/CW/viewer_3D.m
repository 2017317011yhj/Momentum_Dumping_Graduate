close all;
clc;

Re = 6371*1000;

time = out.tout;

HILL_X_wrt_ECI = out.HILL_X_wrt_ECI * 1500000;
HILL_Y_wrt_ECI = out.HILL_Y_wrt_ECI * 1500000;
HILL_Z_wrt_ECI = out.HILL_Z_wrt_ECI * 1500000;
% F_vec_eci      = out.F_ECI*1500000;
Target_State   = out.Target_Statevec;
Target_Pos     = Target_State(:,1:3);
Target_Vel     = Target_State(:,4:6);
Service_Pos    = out.service_Pos;

figure;
subplot(1,2,1);
plot3(0,0,0,'k.','MarkerSize',20);
hold on; grid on;
set(gca,'clipping','off');
quiver3(0,0,0,Re*1.5,0,0,'k','LineWidth',1.5);
quiver3(0,0,0,0,Re*1.5,0,'k','LineWidth',1.5);
quiver3(0,0,0,0,0,Re*1.5,'k','LineWidth',1.5);
axis equal;
axis([-Re*1.5 Re*1.5 -Re*1.5 Re*1.5 -Re*1.5 Re*1.5]);
xlabel('ECI_X [m]');
ylabel('ECI_Y [m]');
zlabel('ECI_Z [m]');

plot3(Target_Pos(:,1),Target_Pos(:,2),Target_Pos(:,3),'k-','LineWidth',1.1);
plot3(Service_Pos(:,1),Service_Pos(:,2),Service_Pos(:,3),'r-','LineWidth',1.1);

HILL_X_hlr = quiver3(     Target_Pos(1,1),     Target_Pos(1,2),     Target_Pos(1,3),...
                      HILL_X_wrt_ECI(1,1), HILL_X_wrt_ECI(1,2), HILL_X_wrt_ECI(1,3),'r','LineWidth',2);
HILL_Y_hlr = quiver3(     Target_Pos(1,1),     Target_Pos(1,2),     Target_Pos(1,3),...
                      HILL_Y_wrt_ECI(1,1), HILL_Y_wrt_ECI(1,2), HILL_Y_wrt_ECI(1,3),'g','LineWidth',2);
HILL_Z_hlr = quiver3(     Target_Pos(1,1),     Target_Pos(1,2),     Target_Pos(1,3),...
                      HILL_Z_wrt_ECI(1,1), HILL_Z_wrt_ECI(1,2), HILL_Z_wrt_ECI(1,3),'b','LineWidth',2);
HILL_Pos_hlr = plot3(Target_Pos(1,1), Target_Pos(1,2), Target_Pos(1,3),'k.','MarkerSize',30);

% F_ECI_hlr = quiver3( Target_Pos(1,1), Target_Pos(2,2), Target_Pos(1,3),...
%                       F_vec_eci(1,1),  F_vec_eci(1,2),  F_vec_eci(1,3),'k','LineWidth',2);
Service_Pos_hlr = plot3(Service_Pos(1,1),Service_Pos(1,2), Service_Pos(1,3),'r.','MarkerSize',30);


for i=1:700:length(time)
    set(HILL_Pos_hlr, 'XData', Target_Pos(i,1), 'YData', Target_Pos(i,2), 'ZData', Target_Pos(i,3))

    set(HILL_X_hlr, 'XData',     Target_Pos(i,1), 'YData',     Target_Pos(i,2), 'ZData',     Target_Pos(i,3), ...
                    'UData', HILL_X_wrt_ECI(i,1), 'VData', HILL_X_wrt_ECI(i,2), 'WData', HILL_X_wrt_ECI(i,3));

    set(HILL_Y_hlr, 'XData',     Target_Pos(i,1), 'YData',     Target_Pos(i,2), 'ZData',     Target_Pos(i,3), ...
                    'UData', HILL_Y_wrt_ECI(i,1), 'VData', HILL_Y_wrt_ECI(i,2), 'WData', HILL_Y_wrt_ECI(i,3));

    set(HILL_Z_hlr, 'XData',     Target_Pos(i,1), 'YData',     Target_Pos(i,2), 'ZData',     Target_Pos(i,3), ...
                    'UData', HILL_Z_wrt_ECI(i,1), 'VData', HILL_Z_wrt_ECI(i,2), 'WData', HILL_Z_wrt_ECI(i,3));

%     set( F_ECI_hlr, 'XData', Target_Pos(i,1), 'YData', Target_Pos(i,2), 'ZData', Target_Pos(i,3), ...
%                     'UData',  F_vec_eci(i,1), 'VData',  F_vec_eci(i,2), 'WData',  F_vec_eci(i,3));

    set(Service_Pos_hlr, 'XData', Service_Pos(i,1), 'YData', Service_Pos(i,2), 'ZData', Service_Pos(i,3))

    drawnow;
    pause(0.0001);
end