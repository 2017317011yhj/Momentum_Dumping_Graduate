close all;
clc;

Earth_R = 6371.8*1000;

time = out.tout;
% (1) - semimajor axis of the orbit in meters.
% (2) - eccentricity.
% (3) - inclination in radians.
% (4) - right ascension of ascending node in radians.
% (5) - argument of perigee in radians.
% (6) - mean anomaly in radians.
TB_statevec = out.Two_Body_SV_Mode5;
J2_statevec = out.J2_SV_Mode5;
J4_statevec = out.J4_SV_Mode5;
axis_max = max(vecnorm(TB_statevec(:,1:3)'))+1000000;

figure('Name','Two-body vs J2 vs J4 2D Comparison');
subplot(3,1,1);
plot(time, TB_statevec(:,1),'k','LineWidth',2);
title('Two-Body VS J_2 V2 J_4 wrt ECI [m]')
hold on; grid on;
plot(time, J2_statevec(:,1),'r--','LineWidth',1.5);
plot(time, J4_statevec(:,1),'b--','LineWidth',1.5);
xlim([min(time), max(time)]);
ylabel('Pos_X [m]');
xlabel('Time [sec]')

subplot(3,1,2);
plot(time, TB_statevec(:,2),'k','LineWidth',2);
hold on; grid on;
plot(time, J2_statevec(:,2),'r--','LineWidth',1.5);
plot(time, J4_statevec(:,2),'b--','LineWidth',1.5);
ylabel('Pos_Y [m]');
xlabel('Time [sec]')

subplot(3,1,3);
plot(time, TB_statevec(:,3),'k','LineWidth',2);
hold on; grid on;
plot(time, J2_statevec(:,3),'r--','LineWidth',1.5);
plot(time, J4_statevec(:,3),'b--','LineWidth',1.5);
xlim([min(time), max(time)]);
ylabel('Pos_Z [m]');
xlabel('Time [sec]');

figure('Name','Two-body vs J2 vs J4 3D Comparison');
quiver3(0,0,0,axis_max,0,0,'k'); % ECI X axis
hold on; grid on;
quiver3(0,0,0,0,axis_max,0,'k'); % ECI Y axis
quiver3(0,0,0,0,0,axis_max,'k'); % ECI Z axis
plot3(TB_statevec(:,1),TB_statevec(:,2),TB_statevec(:,3),'k-');
plot3(J2_statevec(:,1),J2_statevec(:,2),J2_statevec(:,3),'r-');
plot3(J4_statevec(:,1),J4_statevec(:,2),J4_statevec(:,3),'b-');
axis([-axis_max axis_max -axis_max axis_max -axis_max axis_max])
axis equal;
xlabel('Pos_X [m]');
ylabel('Pos_Y [m]');
zlabel('Pos_Z [m]');

figure('Name','Two-body vs J2 vs J4 3D Comparison Mov');
quiver3(0,0,0,axis_max,0,0,'k'); % ECI X axis
hold on; grid on;
quiver3(0,0,0,0,axis_max,0,'k'); % ECI Y axis
quiver3(0,0,0,0,0,axis_max,'k'); % ECI Z axis
% plot3(TB_statevec(:,1),TB_statevec(:,2),TB_statevec(:,3),'k-');
% plot3(J2_statevec(:,1),J2_statevec(:,2),J2_statevec(:,3),'r-');
% plot3(J4_statevec(:,1),J4_statevec(:,2),J4_statevec(:,3),'b-');
TB_hlr = plot3(TB_statevec(1,1),TB_statevec(1,2),TB_statevec(1,3),'k.','MarkerSize',30);
J2_hlr = plot3(J2_statevec(1,1),J2_statevec(1,2),J2_statevec(1,3),'r.','MarkerSize',30);
J4_hlr = plot3(J4_statevec(1,1),J4_statevec(1,2),J4_statevec(1,3),'b.','MarkerSize',30);
axis equal;
axis([-axis_max axis_max -axis_max axis_max -axis_max axis_max])
xlabel('Pos_X [m]');
ylabel('Pos_Y [m]');
zlabel('Pos_Z [m]');

for i=1:100:length(time)
    plot3(TB_statevec(i,1),TB_statevec(i,2),TB_statevec(i,3),'k-');
    plot3(J2_statevec(i,1),J2_statevec(i,2),J2_statevec(i,3),'r-');
    plot3(J4_statevec(i,1),J4_statevec(i,2),J4_statevec(i,3),'b-');
    set(TB_hlr, 'XData', TB_statevec(i,1), 'YData', TB_statevec(i,2), 'ZData', TB_statevec(i,3));
    set(J2_hlr, 'XData', J2_statevec(i,1), 'YData', J2_statevec(i,2), 'ZData', J2_statevec(i,3));
    set(J4_hlr, 'XData', J4_statevec(i,1), 'YData', J4_statevec(i,2), 'ZData', J4_statevec(i,3));
    pause(0.000001);
end

