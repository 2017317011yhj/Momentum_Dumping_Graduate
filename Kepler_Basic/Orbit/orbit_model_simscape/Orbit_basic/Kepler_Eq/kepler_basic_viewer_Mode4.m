close all;
clc;

time = out.tout;
% (1) - semimajor axis of the orbit in meters.
% (2) - eccentricity.
% (3) - inclination in radians.
% (4) - right ascension of ascending node in radians.
% (5) - argument of perigee in radians.
% (6) - mean anomaly in radians.
P_statevec = out.Propat_Statevec_Mode4;
T_statevec = out.Two_Body_Statevec_Mode4;

figure;
subplot(3,1,1);
plot(time, P_statevec(:,1),'r','LineWidth',2);
title('Propat VS Kepler Position wrt ECI [m]')
hold on; grid on;
plot(time, T_statevec(:,1),'k--','LineWidth',1.5);
xlim([min(time), max(time)]);
ylabel('Pos_X [m]');
xlabel('Time [sec]')

subplot(3,1,2);
plot(time, P_statevec(:,2),'r','LineWidth',2);
hold on; grid on;
plot(time, T_statevec(:,2),'k--','LineWidth',1.5);
xlim([min(time), max(time)]);
ylabel('Pos_Y [m]');
xlabel('Time [sec]')

subplot(3,1,3);
plot(time, P_statevec(:,3),'r','LineWidth',2);
hold on; grid on;
plot(time, T_statevec(:,3),'k--','LineWidth',1.5);
xlim([min(time), max(time)]);
ylabel('Pos_Z [m]');
xlabel('Time [sec]');


