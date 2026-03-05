close all;
clc;
% % % % % % Homhann Tranfer view % % % % % % % % % % % %
Earth_R     = 6371.8*1000;
time        = out.tout;
statvec     = out.statvec;
sat_kep     = out.kep;
origin_kep  = out.origin_kep;
target_kep  = out.target_kep;
AXIS_ECI_X  = out.ECI_vecX;
AXIS_ECI_Y  = out.ECI_vecY;
AXIS_ECI_Z  = out.ECI_vecZ;
% AXIS_ECEF_X = out.ECEF_vecX;
% AXIS_ECEF_Y = out.ECEF_vecY;
% AXIS_ECEF_Z = out.ECEF_vecZ;
AXIS_LVLH_X = out.LVLH_vecX;
AXIS_LVLH_Y = out.LVLH_vecY;
AXIS_LVLH_Z = out.LVLH_vecZ;

pos = statvec(:,1:3);% wrt ECI
vel = statvec(:,4:6);% wrt ECI
vel = (vel./vecnorm(vel')')*2500000;
axis_max = (6371.8 + 1000)*1000;

target_statvec = orbit_maker(target_kep);
origin_statvec = orbit_maker(origin_kep);

figure;
% % Figure은 가장 기준이되는 ECI에서 그려야 편함 % % % % % % %
% % % % 간단하게 지구 그리기 % % % % % %
[X,Y,Z] = sphere(100);
X1 = X * 6371.8*1000;
Y1 = Y * 6371.8*1000;
Z1 = Z * 6371.8*1000;
earth_ = surf(X1,Y1,Z1);
earth_.EdgeColor = 'k';
earth_.EdgeAlpha = 0.5;
earth_.FaceAlpha = 0.2;
colormap winter;
shading interp;
% % % % % % % % % % % % % % % % % % % %

hold on; grid on;
% % ECI 좌표계 % % % % % % %
quiver3(0,0,0,AXIS_ECI_X(1,1),AXIS_ECI_X(1,2),AXIS_ECI_X(1,3),'k','LineWidth',2); % ECI X axis
quiver3(0,0,0,AXIS_ECI_Y(1,1),AXIS_ECI_Y(1,2),AXIS_ECI_Y(1,3),'k','LineWidth',2); % ECI Y axis
quiver3(0,0,0,AXIS_ECI_Z(1,1),AXIS_ECI_Z(1,2),AXIS_ECI_Z(1,3),'k','LineWidth',2); % ECI Z axis
% % ECEF 좌표계 % % % % % % %
% ECEF_X_hlr = quiver3(0,0,0,AXIS_ECEF_X(1,1),AXIS_ECEF_X(1,2),AXIS_ECEF_X(1,3),'r','LineWidth',2); % ECEF X axis
% ECEF_Y_hlr = quiver3(0,0,0,AXIS_ECEF_Y(1,1),AXIS_ECEF_Y(1,2),AXIS_ECEF_Y(1,3),'r','LineWidth',2); % ECEF Y axis
% ECEF_Z_hlr = quiver3(0,0,0,AXIS_ECEF_Z(1,1),AXIS_ECEF_Z(1,2),AXIS_ECEF_Z(1,3),'r','LineWidth',2); % ECEF Z axis
% % LVLH 좌표계 % % % % % % %
LVLH_X_hlr = quiver3(pos(1,1),pos(1,2),pos(1,3),AXIS_LVLH_X(1,1),AXIS_LVLH_X(1,2),AXIS_LVLH_X(1,3),'b','LineWidth',2); % LVLH X axis
LVLH_Y_hlr = quiver3(pos(1,1),pos(1,2),pos(1,3),AXIS_LVLH_Y(1,1),AXIS_LVLH_Y(1,2),AXIS_LVLH_Y(1,3),'b','LineWidth',2); % LVLH Y axis
LVLH_Z_hlr = quiver3(pos(1,1),pos(1,2),pos(1,3),AXIS_LVLH_Z(1,1),AXIS_LVLH_Z(1,2),AXIS_LVLH_Z(1,3),'b','LineWidth',2); % LVLH Z axis
% % 위성 위치 % % % % % % %
sat_pos_hlr = plot3(pos(1,1), pos(1,2), pos(1,3), 'k.', 'MarkerSize', 30);
% % 위성 위치 한번에 그림% % % % % % % % % % % %
plot3(pos(:,1), pos(:,2), pos(:,3), 'k--');
% % 위성 위치상에서의 속도 벡터 % % % % % % % % %
sat_vel_hlr = quiver3(pos(1,1), pos(1,2), pos(1,3), vel(1,1), vel(1,2), vel(1,3),'m','LineWidth',2);
% % 목표 궤도 한번에 그림% % % % % % %
plot3(target_statvec(:,1),target_statvec(:,2),target_statvec(:,3),'r-');
plot3(origin_statvec(:,1),origin_statvec(:,2),origin_statvec(:,3),'b-');
axis equal;
axis([-axis_max axis_max -axis_max axis_max -axis_max axis_max]);
view(0, 90);
xlabel('ECI_X [m]','FontSize',15);
ylabel('ECI_Y [m]','FontSize',15);
zlabel('ECI_Z [m]','FontSize',15);

for i=1:100:length(time)
    set(sat_pos_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3));
    set(sat_vel_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3), ...
                     'UData', vel(i,1), 'VData', vel(i,2), 'WData', vel(i,3));
    
%     set(ECEF_X_hlr, 'UData', AXIS_ECEF_X(i,1), 'VData', AXIS_ECEF_X(i,2), 'WData', AXIS_ECEF_X(i,3));
%     set(ECEF_Y_hlr, 'UData', AXIS_ECEF_Y(i,1), 'VData', AXIS_ECEF_Y(i,2), 'WData', AXIS_ECEF_Y(i,3));
%     set(ECEF_Z_hlr, 'UData', AXIS_ECEF_Z(i,1), 'VData', AXIS_ECEF_Z(i,2), 'WData', AXIS_ECEF_Z(i,3));
    set(LVLH_X_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3), ...
                    'UData', AXIS_LVLH_X(i,1), 'VData', AXIS_LVLH_X(i,2), 'WData', AXIS_LVLH_X(i,3));
    set(LVLH_Y_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3), ...
                    'UData', AXIS_LVLH_Y(i,1), 'VData', AXIS_LVLH_Y(i,2), 'WData', AXIS_LVLH_Y(i,3));
    set(LVLH_Z_hlr, 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3), ...
                    'UData', AXIS_LVLH_Z(i,1), 'VData', AXIS_LVLH_Z(i,2), 'WData', AXIS_LVLH_Z(i,3));

    str = sprintf('Time : %.2f [sec]', time(i,1));
    title(str,'FontSize',15);
    pause(0.001);
end

