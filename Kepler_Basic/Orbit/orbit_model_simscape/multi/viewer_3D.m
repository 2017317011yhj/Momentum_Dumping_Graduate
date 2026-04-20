close all;
clc;

Re = 6371*1000;

T_statevec = out.T_statevec;
T_statedvec = out.T_statedvec;
body_x = out.eci2body_X*1000000;
body_y = out.eci2body_Y*1000000;
body_z = out.eci2body_Z*1000000;
lvlh_x = out.eci2lvlh_X*2000000;
lvlh_y = out.eci2lvlh_Y*2000000;
lvlh_z = out.eci2lvlh_Z*2000000;
body_x2 = out.eci2body_X*2;
body_y2 = out.eci2body_Y*2;
body_z2 = out.eci2body_Z*2;
lvlh_x2 = out.eci2lvlh_X*2;
lvlh_y2 = out.eci2lvlh_Y*2;
lvlh_z2 = out.eci2lvlh_Z*2;
F_eci  = out.F_eci;
F_eci_ = (F_eci./(vecnorm(F_eci')'))*5000000;

T_position  = T_statevec(:,1:3);
T_velocity  = T_statevec(:,4:6);
T_velocity_ = (T_velocity./(vecnorm(T_velocity')'))*5000000;
T_accel     = T_statedvec(:,4:6);
T_accel_ = (T_accel./(vecnorm(T_accel')'))*5000000;

figure;
% % % % draw wrt ECI Frame
subplot(1,2,1);
sat_pos_hlr = plot3(T_position(1,1),T_position(1,2),T_position(1,3),'k.','MarkerSize',25);
hold on; grid on;
quiver3(0,0,0,Re,0,0,'k');
quiver3(0,0,0,0,Re,0,'k');
quiver3(0,0,0,0,0,Re,'k');
axis equal;
axis([-Re*1.5 Re*1.5 -Re*1.5 Re*1.5 -Re*1.5 Re*1.5]);
xlabel('Pos X[m]');
ylabel('Pos Y[m]');
zlabel('Pos Z[m]');
set(gca,'clipping','off');
nadir_line_hlr = line([0 T_position(1,1)],[0 T_position(1,2)],[0 T_position(1,3)],'color','black','LineWidth',2);

lvlh_x_hlr = quiver3( T_position(1,1), T_position(2,2), T_position(1,3),...
                          lvlh_x(1,1),     lvlh_x(1,2),     lvlh_x(1,3),'r','LineWidth',2);
lvlh_y_hlr = quiver3( T_position(1,1), T_position(1,2), T_position(1,3),...
                          lvlh_y(1,1),     lvlh_y(1,2),     lvlh_y(1,3),'g','LineWidth',2);
lvlh_z_hlr = quiver3( T_position(1,1), T_position(1,2), T_position(1,3),...
                          lvlh_z(1,1),     lvlh_z(1,2),     lvlh_z(1,3),'b','LineWidth',2);
% % draw trajectory % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
plot3(T_position(:,1), T_position(:,2),T_position(:,3),'k-','LineWidth',2);

% % % % draw wrt LVLH Frame
subplot(1,2,2);
plot3(T_position(:,1), T_position(:,2),T_position(:,3),'k-','LineWidth',2);
xlabel('Pos X[m]');
ylabel('Pos Y[m]');
zlabel('Pos Z[m]');
axis equal;
axis([T_position(1,1)-5, T_position(1,1)+5, ...
      T_position(1,2)-5, T_position(1,2)+5, ...
      T_position(1,3)-5, T_position(1,3)+5])
hold on;    grid on;
sat_pos_hlr2 = plot3(T_position(1,1),T_position(1,2),T_position(1,3),'k.','MarkerSize',25);

lvlh_x_hlr2 = quiver3( T_position(1,1), T_position(2,2), T_position(1,3),...
                           lvlh_x(1,1),     lvlh_x(1,2),     lvlh_x(1,3),'k','LineWidth',3);
lvlh_y_hlr2 = quiver3( T_position(1,1), T_position(1,2), T_position(1,3),...
                           lvlh_y(1,1),     lvlh_y(1,2),     lvlh_y(1,3),'k','LineWidth',3);
lvlh_z_hlr2 = quiver3( T_position(1,1), T_position(1,2), T_position(1,3),...
                           lvlh_z(1,1),     lvlh_z(1,2),     lvlh_z(1,3),'k','LineWidth',3);
body_x_hlr2 = quiver3( T_position(1,1), T_position(2,2), T_position(1,3),...
                           body_x(1,1),     body_x(1,2),     body_x(1,3),'r','LineWidth',3);
body_y_hlr2 = quiver3( T_position(1,1), T_position(1,2), T_position(1,3),...
                           body_y(1,1),     body_y(1,2),     body_y(1,3),'g','LineWidth',3);
body_z_hlr2 = quiver3( T_position(1,1), T_position(1,2), T_position(1,3),...
                           body_z(1,1),     body_z(1,2),     body_z(1,3),'b','LineWidth',3);
nadir_line_hlr2 = line([0 T_position(1,1)],[0 T_position(1,2)],[0 T_position(1,3)],'color','cyan','LineWidth',2);


for i=1:100:length(T_position)
    subplot(1,2,1);
% % % % draw satellite position %
    set(sat_pos_hlr, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3))
% % % % draw LVLH Frame % % % % % % % % % % % % % % % % % %
    set(lvlh_x_hlr, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     lvlh_x(i,1), 'VData',     lvlh_x(i,2), 'WData',     lvlh_x(i,3));
    set(lvlh_y_hlr, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     lvlh_y(i,1), 'VData',     lvlh_y(i,2), 'WData',     lvlh_y(i,3));
    set(lvlh_z_hlr, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     lvlh_z(i,1), 'VData',     lvlh_z(i,2), 'WData',     lvlh_z(i,3));
    set(nadir_line_hlr, 'XData', [0 T_position(i,1)], 'YData', [0 T_position(i,2)], 'ZData', [0 T_position(i,3)])
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             T_velocity_(i,1),T_velocity_(i,2),T_velocity_(i,3),'r','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             lvlh_x(i,1),lvlh_x(i,2),lvlh_x(i,3),'r','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             lvlh_y(i,1),lvlh_y(i,2),lvlh_y(i,3),'g','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             lvlh_z(i,1),lvlh_z(i,2),lvlh_z(i,3),'b','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             F_eci_(i,1),F_eci_(i,2),F_eci_(i,3),'b','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             F_eci_(1,1),F_eci_(1,2),F_eci_(1,3),'b','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             T_accel_(i,1),T_accel_(i,2),T_accel_(i,3),'b','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             body_x(i,1),body_x(i,2),body_x(i,3),'r','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             body_y(i,1),body_y(i,2),body_y(i,3),'g','LineWidth',0.5);
%     quiver3( T_position(i,1), T_position(i,2), T_position(i,3),...
%             body_z(i,1),body_z(i,2),body_z(i,3),'b','LineWidth',0.5);

    drawnow;

    subplot(1,2,2);
    set(sat_pos_hlr2, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3))
    axis([T_position(i,1)-5, T_position(i,1)+5, ...
          T_position(i,2)-5, T_position(i,2)+5, ...
          T_position(i,3)-5, T_position(i,3)+5]);

    set(lvlh_x_hlr2, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     lvlh_x2(i,1), 'VData',     lvlh_x2(i,2), 'WData',     lvlh_x2(i,3));
    set(lvlh_y_hlr2, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     lvlh_y2(i,1), 'VData',     lvlh_y2(i,2), 'WData',     lvlh_y2(i,3));
    set(lvlh_z_hlr2, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     lvlh_z2(i,1), 'VData',     lvlh_z2(i,2), 'WData',     lvlh_z2(i,3));
    set(body_x_hlr2, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     body_x2(i,1), 'VData',     body_x2(i,2), 'WData',     body_x2(i,3));
    set(body_y_hlr2, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     body_y2(i,1), 'VData',     body_y2(i,2), 'WData',     body_y2(i,3));
    set(body_z_hlr2, 'XData', T_position(i,1), 'YData', T_position(i,2), 'ZData', T_position(i,3), ...
                    'UData',     body_z2(i,1), 'VData',     body_z2(i,2), 'WData',     body_z2(i,3));
    set(nadir_line_hlr2, 'XData', [0 T_position(i,1)], 'YData', [0 T_position(i,2)], 'ZData', [0 T_position(i,3)])

    drawnow;

end

