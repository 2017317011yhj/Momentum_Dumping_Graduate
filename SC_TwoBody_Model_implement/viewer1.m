close all;
clc;

sim_t = out.tout;
ss_pos_eci = out.SS_POS_ECI;
ss_vel_eci = out.SS_VEL_ECI;
ss_acc_eci = out.SS_ACC_ECI;

ts_rel_pos_eci = out.TS_REL_POS_ECI;
ts_rel_vel_eci = out.TS_REL_VEL_ECI;
ts_rel_acc_eci = out.TS_REL_ACC_ECI;

figure('Name','SS ECI POS Data Log');
plot(sim_t, ss_pos_eci(:,1));
hold on; grid on;
plot(sim_t, ss_pos_eci(:,2));
plot(sim_t, ss_pos_eci(:,3));

figure('Name','SS ECI VEL Data Log');
plot(sim_t, ss_vel_eci(:,1));
hold on; grid on;
plot(sim_t, ss_vel_eci(:,2));
plot(sim_t, ss_vel_eci(:,3));

figure('Name','SS ACC VEL Data Log');
plot(sim_t, ss_acc_eci(:,1));
hold on; grid on;
plot(sim_t, ss_acc_eci(:,2));
plot(sim_t, ss_acc_eci(:,3));

figure('Name','Rel TARGET POS');
plot3(ts_rel_pos_eci(:,1),...
      ts_rel_pos_eci(:,2),...
      ts_rel_pos_eci(:,3),'k-');
grid on;
xlabel('REL POS X [m]');
ylabel('REL POS Y [m]');
zlabel('REL POS Z [m]');


