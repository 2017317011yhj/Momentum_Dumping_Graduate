close all;
clc;

sim_t = out.tout;
ss_pos_i = out.SS_POS_I;
ss_vel_i = out.SS_VEL_I;
ss_acc_i = out.SS_ACC_I;
ss_angle_i = out.SS_angle_I;
SS_q_b = out.SS_q_b;
ss_rate_b = out.SS_w_b;
ss_rated_b = out.SS_wd_b;

ts_pos_i = out.TS_POS_I;
ts_vel_i = out.TS_VEL_I;
ts_acc_i = out.TS_ACC_I;
ts_rated_b = out.TS_wd;
ts_rate_b = out.TS_wb; 
ts_q_b = out.TS_q;

rel_ts_pos = out.REL_TS_POS_I;
rel_ts_vel = out.REL_TS_VEL_I;
rel_ts_acc = out.REL_TS_ACC_I;

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


figure('Name','TS Relative Position wrt SS [m]');
plot3(rel_ts_pos(:,1),rel_ts_pos(:,2),rel_ts_pos(:,3),'k-');
grid on;
xlabel('Rel POS I X [m]');
ylabel('Rel POS I Y [m]');
zlabel('Rel POS I Z [m]');

return
%%
figure(1)
title('SS pos in ECI')
hold on; grid on; 
xlabel('X [m]');
ylabel('Y [m]');
zlabel('Z [m]');
axis equal
axis([-1 1 -1 1 -1 1]*7000000)
view(-20,40)

plot3(ss_pos_i(:,1),ss_pos_i(:,2),ss_pos_i(:,3),'r')
quiver3(0,0,0,2000000,0,0,'k',MaxHeadSize=0.5)
quiver3(0,0,0,0,2000000,0,'k',MaxHeadSize=0.5)
quiver3(0,0,0,0,0,2000000,'k',MaxHeadSize=0.5)

p1 = plot3(ss_pos_i(1,1),ss_pos_i(1,2),ss_pos_i(1,3),'.r',"MarkerSize",20);

for i = 1:30:length(sim_t)
set(p1,"XData",ss_pos_i(i,1),"YData",ss_pos_i(i,2),"ZData",ss_pos_i(i,3))

drawnow;
pause(0.0001);
end

%%
figure(2)
title('Target-Chaser rel frame in ECI')
hold on; grid on;
xlabel('X [m]');
ylabel('Y [m]');
zlabel('Z [m]');
axis equal
axis([-1 1 -1 1 -1 1]*1.5)
view(-20,40) 

%
% chaser 경로 그려야함 
%

plot3(0,0,0,'b.',"MarkerSize",20)
quiver3(0,0,0,0.5,0,0,'k')
quiver3(0,0,0,0,0.5,0,'k')
quiver3(0,0,0,0,0,0.5,'k')

norm_r = rel_ts_pos(1,:)/norm (rel_ts_pos(1,:));
p1 = plot3(-norm_r(1),-norm_r(2),-norm_r(3),'r.',"MarkerSize",20);
s_qv1 = quiver3(-norm_r(1),-norm_r(2),-norm_r(3),0,0,0,'r');
s_qv2 = quiver3(-norm_r(1),-norm_r(2),-norm_r(3),0,0,0,'g');
s_qv3 = quiver3(-norm_r(1),-norm_r(2),-norm_r(3),0,0,0,'b');

for i = 1:50:length(sim_t)
r_s = quat_to_rotm(SS_q_b(i,:))*0.5;

norm_r = rel_ts_pos(i,:)/norm(rel_ts_pos(i,:));
set(p1,"XData",-norm_r(1),"YData",-norm_r(2),"ZData",-norm_r(3))

set(s_qv1,"XData",-norm_r(1),"YData",-norm_r(2),"ZData",-norm_r(3), ...
    "UData", r_s(1,1),"VData",r_s(2,1),"WData",r_s(3,1))
set(s_qv2,"XData",-norm_r(1),"YData",-norm_r(2),"ZData",-norm_r(3), ...
    "UData", r_s(1,2),"VData",r_s(2,2),"WData",r_s(3,2))
set(s_qv3,"XData",-norm_r(1),"YData",-norm_r(2),"ZData",-norm_r(3), ...
    "UData", r_s(1,3),"VData",r_s(2,3),"WData",r_s(3,3))

drawnow;
pause(0.0001);
end


 

%%
figure(3)
title('T&S in ECI')
hold on; grid on; 
xlabel('X [m]');
ylabel('Y [m]');
zlabel('Z [m]');
axis equal
axis padded
% axis([-1 1 -1 1 -1 1]*7000000)
view(-20,40)


s_qv1 = quiver3(ss_pos_i(1,1),ss_pos_i(1,2),ss_pos_i(1,3),0,0,0,'r');
s_qv2 = quiver3(ss_pos_i(1,1),ss_pos_i(1,2),ss_pos_i(1,3),0,0,0,'g');
s_qv3 = quiver3(ss_pos_i(1,1),ss_pos_i(1,2),ss_pos_i(1,3),0,0,0,'b');

p1 = plot3(ss_pos_i(1,1),ss_pos_i(1,2),ss_pos_i(1,3),'.r',"MarkerSize",20);
p2 = plot3(ts_pos_i(1,1),ts_pos_i(1,2),ts_pos_i(1,3),'.b',"MarkerSize",20);

for i = 1:50:length(sim_t)
r_s = quat_to_rotm(SS_q_b(i,:))*5;

set(p1,"XData",ss_pos_i(i,1),"YData",ss_pos_i(i,2),"ZData",ss_pos_i(i,3))
set(p2,"XData",ts_pos_i(i,1),"YData",ts_pos_i(i,2),"ZData",ts_pos_i(i,3))
set(s_qv1,"XData",ss_pos_i(i,1),"YData",ss_pos_i(i,2),"ZData",ss_pos_i(i,3), ...
    "UData", r_s(1,1),"VData",r_s(2,1),"WData",r_s(3,1))
set(s_qv2,"XData",ss_pos_i(i,1),"YData",ss_pos_i(i,2),"ZData",ss_pos_i(i,3), ...
    "UData", r_s(1,2),"VData",r_s(2,2),"WData",r_s(3,2))
set(s_qv3,"XData",ss_pos_i(i,1),"YData",ss_pos_i(i,2),"ZData",ss_pos_i(i,3), ...
    "UData", r_s(1,3),"VData",r_s(2,3),"WData",r_s(3,3))

drawnow;
pause(0.0001);

end



function R = quat_to_rotm(q)
    % q = [qw qx qy qz], Body -> Inertial
    qw = q(1); qx = q(2); qy = q(3); qz = q(4);

    R = [1-2*(qy^2+qz^2),   2*(qx*qy-qz*qw),   2*(qx*qz+qy*qw);
         2*(qx*qy+qz*qw),   1-2*(qx^2+qz^2),   2*(qy*qz-qx*qw);
         2*(qx*qz-qy*qw),   2*(qy*qz+qx*qw),   1-2*(qx^2+qy^2)];
end