% close all;
clc;

sim_t = out.tout;
ss_pos_i = out.SS_POS_I;
ss_vel_i = out.SS_VEL_I;
ss_acc_i = out.SS_ACC_I;
ss_angle_i = out.SS_angle_I;
ss_q_b = out.SS_q_b;
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

los_angle = out.LoS_angle;
wheel_rate = out.wheel_rate; 
wheel_rated = out.wheel_rated;


%% plot

figure(1);clf
sgtitle('Target-Chaser relative state')
subplot(3,1,1)
hold on;grid on;ylabel('Pos [m]');ylim padded
plot(sim_t, rel_ts_pos(:,1))
plot(sim_t, rel_ts_pos(:,2))
plot(sim_t, rel_ts_pos(:,3))
legend('x','y','z')
subplot(3,1,2)
hold on;grid on;ylabel('Vel [m/s]')
plot(sim_t, rel_ts_vel(:,1))
plot(sim_t, rel_ts_vel(:,2))
plot(sim_t, rel_ts_vel(:,3))
subplot(3,1,3)
hold on;grid on;ylabel('Acc [m/s^2]');xlabel('time [s]')
plot(sim_t, rel_ts_acc(:,1))
plot(sim_t, rel_ts_acc(:,2))
plot(sim_t, rel_ts_acc(:,3))
 
figure(2);clf
sgtitle('LoS angle')
hold on;grid on;ylabel('deg');xlabel('time [s]')
plot(sim_t, los_angle(:,1))
plot(sim_t, los_angle(:,2))
plot(sim_t, los_angle(:,3))
legend('x','y','z')


figure(3);clf
sgtitle('Attitude error')
subplot(3,1,1)
hold on;grid on;ylabel('q_{err}');xlabel('time [s]');ylim padded
q_err = quatmultiply(quatinv(ts_q_b), ss_q_b);
plot(sim_t,q_err)
legend('q_0','q_1','q_2','q_3');
subplot(3,1,2)
hold on;grid on;ylabel('\omega_{err} [deg/s]');xlabel('time [s]');ylim padded
w_err = ss_rate_b - ts_rate_b;
plot(sim_t,w_err)
legend('x','y','z'); 
subplot(3,1,3)
hold on;grid on;ylabel('wheer rate [rpm]');xlabel('time [s]');ylim padded
plot(sim_t,wheel_rate)
legend('w_1','w_2','w_3','w_4')





% figure('Name','SS Inertial POS Data Log [m]');
% plot(sim_t, ss_pos_i(:,1));
% hold on; grid on;
% plot(sim_t, ss_pos_i(:,2));
% plot(sim_t, ss_pos_i(:,3));
% 
% figure('Name','SS Inertial POS Data Log 3D [m]');
% plot3(ss_pos_i(:,1), ss_pos_i(:,2), ss_pos_i(:,3),'k.');
% grid on;
% axis equal;
% xlabel('POS I X [m]');
% ylabel('POS I Y [m]');
% zlabel('POS I Z [m]');

% figure('Name','SS Inertial VEL Data Log [m/s]');
% plot(sim_t, ss_vel_i(:,1));
% hold on; grid on;
% plot(sim_t, ss_vel_i(:,2));
% plot(sim_t, ss_vel_i(:,3));
% 
% figure('Name','SS Inertial ACC Data Log [m/s^2]');
% plot(sim_t, ss_acc_i(:,1));
% hold on; grid on;
% plot(sim_t, ss_acc_i(:,2));
% plot(sim_t, ss_acc_i(:,3));
% 
% figure('Name','SS Inertial Angle Data Log [deg]');
% plot(sim_t, ss_angle_i(:,1));
% hold on; grid on;
% plot(sim_t, ss_angle_i(:,2));
% plot(sim_t, ss_angle_i(:,3));
% 
% figure('Name','SS Inertial Rate Data Log [deg/s]');
% plot(sim_t, ss_rate_b(:,1));
% hold on; grid on;
% plot(sim_t, ss_rate_b(:,2));
% plot(sim_t, ss_rate_b(:,3));
% 
% figure('Name','SS Inertial Rate d Data Log [deg/s^2]');
% title('SS Inertial Rate d Data Log [deg/s^2]')
% plot(sim_t, ss_rated_b(:,1));
% hold on; grid on;
% plot(sim_t, ss_rated_b(:,2));
% plot(sim_t, ss_rated_b(:,3));
% 

% figure('Name','TS Relative Position wrt SS [m]');
% plot3(rel_ts_pos(:,1),rel_ts_pos(:,2),rel_ts_pos(:,3),'k-');
% grid on;
% xlabel('Rel POS I X [m]');
% ylabel('Rel POS I Y [m]');
% zlabel('Rel POS I Z [m]');

 
%%
figure(100);clf
set(gcf, 'Color', 'w');
ax = axes;
title('Target-Chaser rel motion')
hold on; grid on;
xlabel('X [m]');
ylabel('Y [m]');
zlabel('Z [m]');
axis equal
axis([-22 2 -5 5 -3 3])
view(-20,35) 

% stl 모델
stlFile = 'geo_mod.stl';   % 파일명만 바꿔서 사용하세요
TR = stlread(stlFile);

V = TR.Points*0.5;  %   확대


[F,V2] = reducepatch(TR.ConnectivityList, V, 0.5); % 20%만 유지
TR_big = triangulation(F, V2);

% Transform 객체 생성
ht = hgtransform('Parent', ax);

% STL patch 생성 (Parent를 ht로 지정)
h = trisurf(TR_big, ...
    'FaceColor', [0.8 0.8 0.8], ...
    'EdgeColor', 'none', ...
    'FaceAlpha', 0.8, ...
    'Parent', ht);
camlight('right');
lighting gouraud;
% lighting flat

% target
Rs = quat2rotm(ts_q_b(1,:));
ex = Rs * [1;0;0] * 2e+6;
ey = Rs * [0;1;0] * 2e+6;
ez = Rs * [0;0;1] * 2e+6;
t_p = plot3(0,0,0,'b.',"MarkerSize",20); 

% ss
norm_r = rel_ts_pos(1,:)/norm (rel_ts_pos(1,:));
s_p = plot3(-norm_r(1),-norm_r(2),-norm_r(3),'r.',"MarkerSize",20);
s_qvx = quiver3(-norm_r(1),-norm_r(2),-norm_r(3),0,0,0,3,'r','LineWidth',1);
s_qvy = quiver3(-norm_r(1),-norm_r(2),-norm_r(3),0,0,0,3,'g','LineWidth',1);
s_qvz = quiver3(-norm_r(1),-norm_r(2),-norm_r(3),0,0,0,3,'b','LineWidth',1);

% ts
t_qvx = quiver3(0,0,0,ex(1),ex(2),ex(3),3,'r','LineWidth',1);
t_qvy = quiver3(0,0,0,ey(1),ey(2),ey(3),3,'g','LineWidth',1);
t_qvz = quiver3(0,0,0,ez(1),ez(2),ez(3),3,'b','LineWidth',1);

legend([t_p s_p s_qvx s_qvy s_qvz], {'target','chaser','x','y','z'},'Location','southeast');
 
for i = 1:100:length(sim_t)
    % frame
    % ss
    Rs = quat2rotm(ss_q_b(i,:));
    r_s = Rs*0.5;
   
    norm_r = rel_ts_pos(i,:)/norm(rel_ts_pos(i,:));
    set(s_p,"XData",-rel_ts_pos(i,1),"YData",-rel_ts_pos(i,2),"ZData",-rel_ts_pos(i,3))

    set(s_qvx,"XData",-rel_ts_pos(i,1),"YData",-rel_ts_pos(i,2),"ZData",-rel_ts_pos(i,3), ...
        "UData", r_s(1,1),"VData",r_s(2,1),"WData",r_s(3,1))
    set(s_qvy,"XData",-rel_ts_pos(i,1),"YData",-rel_ts_pos(i,2),"ZData",-rel_ts_pos(i,3), ...
        "UData", r_s(1,2),"VData",r_s(2,2),"WData",r_s(3,2))
    set(s_qvz,"XData",-rel_ts_pos(i,1),"YData",-rel_ts_pos(i,2),"ZData",-rel_ts_pos(i,3), ...
        "UData", r_s(1,3),"VData",r_s(2,3),"WData",r_s(3,3))
    % ts
    Rt = quat2rotm(ts_q_b(i,:));
    r_t = Rt*0.5;
    set(t_qvx,"UData", r_t(1,1),"VData",r_t(2,1),"WData",r_t(3,1))
    set(t_qvy,"UData", r_t(1,2),"VData",r_t(2,2),"WData",r_t(3,2))
    set(t_qvz,"UData", r_t(1,3),"VData",r_t(2,3),"WData",r_t(3,3))
    
    % spacecraft
    T = eye(4);
    T(1:3,1:3) = Rs;
    T(1:3,4) = -rel_ts_pos(i,:)';
    ht.Matrix = T;

    
    drawnow;
    % pause(0.001);
end


 

