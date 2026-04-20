close all;
clc;

sim_t = out.tout;
ss_pos_i = out.SS_POS_I;
ss_vel_i = out.SS_VEL_I;
ss_acc_i = out.SS_ACC_I;
ss_angle_i = out.SS_angle_I;
ss_rate_b = out.SS_w_b;
ss_rated_b = out.SS_wd_b;

figure('Name','SS Inertial POS Data Log [m]');
plot(sim_t, ss_pos_i(:,1));
hold on; grid on;
plot(sim_t, ss_pos_i(:,2));
plot(sim_t, ss_pos_i(:,3));

figure('Name','SS Inertial POS Data Log 3D [m]');
plot3(ss_pos_i(:,1), ss_pos_i(:,2), ss_pos_i(:,3),'k.');
grid on;
axis equal;
xlabel('POS I X [m]');
ylabel('POS I Y [m]');
zlabel('POS I Z [m]');

figure('Name','SS Inertial VEL Data Log [m/s]');
plot(sim_t, ss_vel_i(:,1));
hold on; grid on;
plot(sim_t, ss_vel_i(:,2));
plot(sim_t, ss_vel_i(:,3));

figure('Name','SS Inertial ACC Data Log [m/s^2]');
plot(sim_t, ss_acc_i(:,1));
hold on; grid on;
plot(sim_t, ss_acc_i(:,2));
plot(sim_t, ss_acc_i(:,3));

figure('Name','SS Inertial Angle Data Log [deg]');
plot(sim_t, ss_angle_i(:,1));
hold on; grid on;
plot(sim_t, ss_angle_i(:,2));
plot(sim_t, ss_angle_i(:,3));

figure('Name','SS Inertial Rate Data Log [deg/s]');
plot(sim_t, ss_rate_b(:,1));
hold on; grid on;
plot(sim_t, ss_rate_b(:,2));
plot(sim_t, ss_rate_b(:,3));

figure('Name','SS Inertial Rate d Data Log [deg/s^2]');
plot(sim_t, ss_rated_b(:,1));
hold on; grid on;
plot(sim_t, ss_rated_b(:,2));
plot(sim_t, ss_rated_b(:,3));
