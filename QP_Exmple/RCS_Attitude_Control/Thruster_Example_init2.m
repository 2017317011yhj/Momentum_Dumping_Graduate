clear all;
close all;
clc;

THR_Force = 0.01;
 
THR_dt = 0.01;
THR_freq = 0.1;
% %  Base기준 RCS Position
% THR1_Pos = [0.15 -0.15 -0.15]';
% THR2_Pos = [0.15 -0.15 -0.15]';
% THR3_Pos = [0.15 -0.15 -0.15]';
% 
% THR4_Pos = [0.15 0.15 0.15]';
% THR5_Pos = [0.15 0.15 0.15]';
% THR6_Pos = [0.15 0.15 0.15]';
% 
% THR7_Pos = [-0.15 -0.15 0.15]';
% THR8_Pos = [-0.15 -0.15 0.15]';
% THR9_Pos = [-0.15 -0.15 0.15]';
% 
% THR10_Pos = [-0.15 0.15 -0.15]';
% THR11_Pos = [-0.15 0.15 -0.15]';
% THR12_Pos = [-0.15 0.15 -0.15]';
% 
% THR_Pos = [THR1_Pos,THR2_Pos,THR3_Pos,...
%                 THR4_Pos,THR5_Pos,THR6_Pos,...
%                 THR7_Pos,THR8_Pos,THR9_Pos,...
%                 THR10_Pos,THR11_Pos,THR12_Pos];


% % % % % % % % % % % % % % % % % % % 

% THR1_R1_deg = [0,90,0];%'ZYX'
% THR2_R1_deg = [0,0,90];%'ZYX'
% THR3_R1_deg = [0,180,0];%'ZYX'
% 
% THR4_R1_deg = [0,90,0];%'ZYX'
% THR5_R1_deg = [0,0,-90];%'ZYX'
% THR6_R1_deg = [0,0,0];%'ZYX'
% 
% THR7_R1_deg = [0,-90,0];%'ZYX'
% THR8_R1_deg = [0,0,90];%'ZYX'
% THR9_R1_deg = [0,0,0];%'ZYX'
% 
% THR10_R1_deg = [0,-90,0];%'ZYX'
% THR11_R1_deg = [0,0,-90];%'ZYX'
% THR12_R1_deg = [0,180,0];%'ZYX'
% 
% 
% THR1_R1 = angle2dcm(THR1_R1_deg(1)*pi/180,...
%                             THR1_R1_deg(2)*pi/180,...
%                             THR1_R1_deg(3)*pi/180,'ZYX')';
% THR2_R1 = angle2dcm(THR2_R1_deg(1)*pi/180,...
%                             THR2_R1_deg(2)*pi/180,...
%                             THR2_R1_deg(3)*pi/180,'ZYX')';
% THR3_R1 = angle2dcm(THR3_R1_deg(1)*pi/180,...
%                             THR3_R1_deg(2)*pi/180,...
%                             THR3_R1_deg(3)*pi/180,'ZYX')';
% THR4_R1 = angle2dcm(THR4_R1_deg(1)*pi/180,...
%                             THR4_R1_deg(2)*pi/180,...
%                             THR4_R1_deg(3)*pi/180,'ZYX')';
% THR5_R1 = angle2dcm(THR5_R1_deg(1)*pi/180,...
%                             THR5_R1_deg(2)*pi/180,...
%                             THR5_R1_deg(3)*pi/180,'ZYX')';
% THR6_R1 = angle2dcm(THR6_R1_deg(1)*pi/180,...
%                             THR6_R1_deg(2)*pi/180,...
%                             THR6_R1_deg(3)*pi/180,'ZYX')';
% THR7_R1 = angle2dcm(THR7_R1_deg(1)*pi/180,...
%                             THR7_R1_deg(2)*pi/180,...
%                             THR7_R1_deg(3)*pi/180,'ZYX')';
% THR8_R1 = angle2dcm(THR8_R1_deg(1)*pi/180,...
%                             THR8_R1_deg(2)*pi/180,...
%                             THR8_R1_deg(3)*pi/180,'ZYX')';
% THR9_R1 = angle2dcm(THR9_R1_deg(1)*pi/180,...
%                             THR9_R1_deg(2)*pi/180,...
%                             THR9_R1_deg(3)*pi/180,'ZYX')';
% THR10_R1 = angle2dcm(THR10_R1_deg(1)*pi/180,...
%                             THR10_R1_deg(2)*pi/180,...
%                             THR10_R1_deg(3)*pi/180,'ZYX')';
% THR11_R1 = angle2dcm(THR11_R1_deg(1)*pi/180,...
%                             THR11_R1_deg(2)*pi/180,...
%                             THR11_R1_deg(3)*pi/180,'ZYX')';
% THR12_R1 = angle2dcm(THR12_R1_deg(1)*pi/180,...
%                             THR12_R1_deg(2)*pi/180,...
%                             THR12_R1_deg(3)*pi/180,'ZYX')';
% 
% F1_v = THR1_R1(:,3);
% F2_v = THR2_R1(:,3);
% F3_v = THR3_R1(:,3);
% F4_v = THR4_R1(:,3);
% F5_v = THR5_R1(:,3);
% F6_v = THR6_R1(:,3);
% F7_v = THR7_R1(:,3);
% F8_v = THR8_R1(:,3);
% F9_v = THR9_R1(:,3);
% F10_v = THR10_R1(:,3);
% F11_v = THR11_R1(:,3);
% F12_v = THR12_R1(:,3);
% 
% f1 = -THR1_R1(:,3);
% f2 = -THR2_R1(:,3);
% f3 = -THR3_R1(:,3);
% f4 = -THR4_R1(:,3);
% f5 = -THR5_R1(:,3);
% f6 = -THR6_R1(:,3);
% f7 = -THR7_R1(:,3);
% f8 = -THR8_R1(:,3);
% f9 = -THR9_R1(:,3);
% f10 = -THR10_R1(:,3);
% f11 = -THR11_R1(:,3);
% f12 = -THR12_R1(:,3);
% 
% F_vec = [F1_v,F2_v,F3_v,F4_v,F5_v,F6_v,F7_v,F8_v,F9_v,F10_v,F11_v,F12_v];
% f = [f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12];

% % % % % % +Z Size % % % % % % % % %
RCS1_ROT = [0 90 0]';%ZYX [deg]
RCS2_ROT = [0 -90 0]';%ZYX [deg]
RCS3_ROT = [0 0 -90]';%ZYX [deg]
RCS4_ROT = [0 0 90]';%ZYX [deg]

RCS1_POS = [0.2 0 0.85]';%XYZ [m]
RCS2_POS = [-0.2 0 0.85]';%XYZ [m]
RCS3_POS = [0 0.2 0.85]';%XYZ [m]
RCS4_POS = [0 -0.2 0.85]';%XYZ [m]

RCS1_THR = [-1 0 0]';
RCS2_THR = [1 0 0]';
RCS3_THR = [0 -1 0]';
RCS4_THR = [0 1 0]';

% % % % % % -Z Size % % % % % % % % %
RCS5_ROT = [0 90 0]';%ZYX [deg]
RCS6_ROT = [0 -90 0]';%ZYX [deg]
RCS7_ROT = [0 0 -90]';%ZYX [deg]
RCS8_ROT = [0 0 90]';%ZYX [deg]

RCS5_POS = [0.2 0 -0.72]';%XYZ [m]
RCS6_POS = [-0.2 0 -0.72]';%XYZ [m]
RCS7_POS = [0 0.2 -0.72]';%XYZ [m]
RCS8_POS = [0 -0.2 -0.72]';%XYZ [m]

RCS5_THR = [-1 0 0]';
RCS6_THR = [1 0 0]';
RCS7_THR = [0 -1 0]';
RCS8_THR = [0 1 0]';

% % % % % % +Y Size % % % % % % % % %
RCS9_ROT   = [0 90 0]';%ZYX [deg]
RCS10_ROT = [0 -90 0]';%ZYX [deg]
RCS11_ROT = [0 180 0]';%ZYX [deg]
RCS12_ROT = [0 0 0]';%ZYX [deg]

RCS9_POS   = [0.2 0.85 0]';%ZYX [deg]
RCS10_POS = [-0.2 0.85 0]';%ZYX [deg]
RCS11_POS = [0 0.85 -0.2]';%ZYX [deg]
RCS12_POS = [0 0.85 0.2]';%ZYX [deg]

RCS9_THR  = [-1 0 0]';
RCS10_THR = [1 0 0]';
RCS11_THR = [0 0 1]';
RCS12_THR = [0 0 -1]';

% % % % % % -Y Size % % % % % % % % %
RCS13_ROT = [0 90 0]';%ZYX [deg]
RCS14_ROT = [0 -90 0]';%ZYX [deg]
RCS15_ROT = [0 180 0]';%ZYX [deg]
RCS16_ROT = [0 0 0]';%ZYX [deg]

RCS13_POS = [0.2 -0.85 0]';%ZYX [deg]
RCS14_POS = [-0.2 -0.85 0]';%ZYX [deg]
RCS15_POS = [0 -0.85 -0.2]';%ZYX [deg]
RCS16_POS = [0 -0.85 0.2]';%ZYX [deg]

RCS13_THR = [-1 0 0]';
RCS14_THR = [1 0 0]';
RCS15_THR = [0 0 1]';
RCS16_THR = [0 0 -1]';

RCS_Pos = [RCS1_POS , RCS2_POS , RCS3_POS , RCS4_POS ,...
           RCS5_POS , RCS6_POS , RCS7_POS , RCS8_POS ,...
           RCS9_POS , RCS10_POS, RCS11_POS, RCS12_POS,...
           RCS13_POS, RCS14_POS, RCS15_POS, RCS16_POS];

RCS_THR_vec = -[RCS1_THR , RCS2_THR , RCS3_THR , RCS4_THR, ...
               RCS5_THR , RCS6_THR , RCS7_THR , RCS8_THR, ...
               RCS9_THR , RCS10_THR, RCS11_THR, RCS12_THR, ...
               RCS13_THR, RCS14_THR, RCS15_THR, RCS16_THR];

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
 
draw_opt_flg = 1;
if draw_opt_flg
    draw_thruster_config([1.3 1.3 1.3], RCS_Pos', RCS_THR_vec');
end


%%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % Draw Thruster Configuration
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
function draw_thruster_config(bodySize, r_thr, F)

%% -------- OPTIONS --------
useNormalized = false;   % true면 방향만(크기 무시), false면 크기 반영
autoscaleOff  = true;    % true면 우리가 정한 스케일 그대로 quiver3에 적용

%% -------- VALIDATION --------
% assert(all(size(r_thr) == [12 3]), "r_thr must be 12x3.");
% assert(all(size(F)     == [12 3]), "F must be 12x3.");

half = bodySize(:)'/2;

%% -------- VECTOR PREP --------
V = F;
if useNormalized
    n = vecnorm(V,2,2);
    n(n < 1e-12) = 1;
    V = V ./ n;
end

% 보기 좋게 스케일링(동체 크기에 맞춰 화살표 길이 자동 설정)
norms = vecnorm(V,2,2);
maxNorm = max(norms);
if maxNorm < 1e-12
    arrowScale = 1.0;
else
    arrowScale = 0.3 * min(half) / maxNorm;  % 화살표 최대 길이 ~ 동체 반폭의 60%
end
U = V * arrowScale;  % quiver에 넣을 벡터

%% -------- DRAW BODY (BOX) --------
hx = half(1); hy = half(2); hz = half(3);
verts = [ -hx -hy -hz;
          +hx -hy -hz;
          +hx +hy -hz;
          -hx +hy -hz;
          -hx -hy +hz;
          +hx -hy +hz;
          +hx +hy +hz;
          -hx +hy +hz ];

faces = [ 1 2 3 4;   % -Z
          5 6 7 8;   % +Z
          1 2 6 5;   % -Y
          2 3 7 6;   % +X
          3 4 8 7;   % +Y
          4 1 5 8 ]; % -X

figure; hold on; grid on; axis equal;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Spacecraft Body + Thruster Mounts + Thrust Vectors');

patch('Vertices', verts, 'Faces', faces, ...
      'FaceAlpha', 0.05, 'EdgeAlpha', 0.6, 'LineWidth', 1.2);

%% -------- DRAW THRUSTERS --------
% Mount points
plot3(r_thr(:,1), r_thr(:,2), r_thr(:,3), 'ko', 'MarkerFaceColor','k', 'MarkerSize', 5);

% Vectors
if autoscaleOff
    quiver3(r_thr(:,1), r_thr(:,2), r_thr(:,3), U(:,1), U(:,2), U(:,3), 0, 'LineWidth', 1.8);
else
    quiver3(r_thr(:,1), r_thr(:,2), r_thr(:,3), U(:,1), U(:,2), U(:,3), 1, 'LineWidth', 1.8);
end

% Labels near arrow tips
tips = r_thr + U;
for i = 1:16
    text(tips(i,1), tips(i,2), tips(i,3), sprintf('  THR%d', i), 'FontSize', 10);
end

% Body axes
axisLen = 0.8 * min(half);
quiver3(0,0,0, axisLen,0,0, 0, 'LineWidth', 2);
quiver3(0,0,0, 0,axisLen,0, 0, 'LineWidth', 2);
quiver3(0,0,0, 0,0,axisLen, 0, 'LineWidth', 2);
text(axisLen,0,0,'  +X'); text(0,axisLen,0,'  +Y'); text(0,0,axisLen,'  +Z');

view(3);


end


