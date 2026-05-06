clc;  

t = out.tout;
TS_POS_I = out.TS_POS_I;
ts_q_b = out.TS_q;

%% STL 파일 경로
stlFile = 'ISS_stationary.stl';   % 파일명만 바꿔서 사용하세요

%% STL 읽기
TR = stlread(stlFile);

scale = 5000;   % 1000배 확대

% 새 triangulation 생성
TR_big = triangulation(TR.ConnectivityList, TR.Points * scale);

figure(111);clf
set(gcf, 'Color', 'w');
ax = axes;
grid on; hold on;
xlabel('ECI X [m]');
ylabel('ECI Y [m]');
zlabel('ECI Z [m]');

%% Transform 객체 생성
ht = hgtransform('Parent', ax);

%% STL patch 생성 (Parent를 ht로 지정)
h = trisurf(TR_big, ...
    'FaceColor', [1 0 0], ...
    'EdgeColor', 'none', ...
    'FaceAlpha', 1.0, ...
    'Parent', ht);

%% 보기 옵션 
title('STL Viewer');

% camlight('headlight');
camlight('right');
lighting gouraud;
material dull;

% draw earth
%%%%%%%%%%%%%%%%%%%%%%%%
% rotate3d on;
n = 50;
Re = 6378137;

% sphere
[x, y, z] = sphere(n);
X = Re * x;
Y = Re * y;
Z = Re * z;

% texture image
texfile = 'earth_texture.jpg';
img = imread(texfile);

% orientation fix
img = flipud(img);

% 변환 객체 생성
ht_earth = hgtransform;

% Earth
hs = surf(X, Y, Z, img, ...
    'FaceColor', 'texturemap', ...
    'EdgeColor', 'none', ...
    'FaceLighting', 'gouraud', ...
    'SpecularStrength', 0.08, ...
    'DiffuseStrength', 0.9, ...
    'AmbientStrength', 0.35, ...
    'FaceAlpha', 0.5, ...
    'Parent', ht_earth);   % <-- 여기 중요
view(-15,40)
camlight('right');
axis equal;
axis(7.5e+06*[-1 1 -1 1 -1 1])

% initial plot
R = quat2rotm(ts_q_b(1,:));
ex = R * [1;0;0] * 2e+6;
ey = R * [0;1;0] * 2e+6;
ez = R * [0;0;1] * 2e+6;

% ECI 좌표축
quiver3(0,0,0,Re*1.0,0,0,'k','LineWidth',2);
quiver3(0,0,0,0,Re*1.0,0,'k','LineWidth',2);
quiver3(0,0,0,0,0,Re*1.0,'k','LineWidth',2);
text(Re*1.0,0,0, 'ECI X [m]', ...
    'Color', 'k', ...
    'FontSize', 12, ...
    'HorizontalAlignment', 'left', ...
    'VerticalAlignment', 'bottom');
text(0,Re*1,0, 'ECI Y [m]', ...
    'Color', 'k', ...
    'FontSize', 12, ...
    'HorizontalAlignment', 'left', ...
    'VerticalAlignment', 'bottom');
text(0,0,Re*1, 'ECI Z [m]', ...
    'Color', 'k', ...
    'FontSize', 12, ...
    'HorizontalAlignment', 'left', ...
    'VerticalAlignment', 'bottom');

% Target 경로
plot3(TS_POS_I(:,1),TS_POS_I(:,2),TS_POS_I(:,3),'k:',"LineWidth",3)
% Target 좌표축
qx = quiver3(TS_POS_I(1,1),TS_POS_I(1,2),TS_POS_I(1,3),ex(1),ex(2),ex(3),1,'r',LineWidth=1.5);
qy = quiver3(TS_POS_I(1,1),TS_POS_I(1,2),TS_POS_I(1,3),ey(1),ey(2),ey(3),1,'g',LineWidth=1.5);
qz = quiver3(TS_POS_I(1,1),TS_POS_I(1,2),TS_POS_I(1,3),ez(1),ez(2),ez(3),1,'b',LineWidth=1.5);

% legend([qx, qy, qz],{'x','y','z'})

R_BS = [ 0  0  1;
         0 -1  0;
         1  0  0 ];

H_BS = eye(4);
H_BS(1:3,1:3) = R_BS;

for i=1:300:length(t)
    eul = quat2eul(ts_q_b(i,:), 'ZYX');

    yaw   = eul(1);
    pitch = eul(2);
    roll  = eul(3);

    % Rz = makehgtform('zrotate', yaw); % rad
    % Ry = makehgtform('yrotate', pitch);
    % Rx = makehgtform('xrotate', roll);
    % T = makehgtform('translate',TS_POS_I(i,:));
    % 적용 순서: 오른쪽부터 먼저 적용
    % ht.Matrix = T * Rz * Ry * Rx;

    T = makehgtform('translate',TS_POS_I(i,:),'zrotate', yaw,'yrotate', pitch,'xrotate', roll);
    ht.Matrix = T*H_BS;

    R = quat2rotm(ts_q_b(i,:));
    ex = R * [1;0;0] * 2e+6;
    ey = R * [0;0;1] * 2e+6;
    ez = R * [0;1;0] * 2e+6; 
    set(qx, 'XData', TS_POS_I(i,1), 'YData', TS_POS_I(i,2), 'ZData', TS_POS_I(i,3), ...
    'Udata',ex(1),'Vdata',ex(2),'Wdata',ex(3));
    set(qy, 'XData', TS_POS_I(i,1), 'YData', TS_POS_I(i,2), 'ZData', TS_POS_I(i,3), ...
    'Udata',ey(1),'Vdata',ey(2),'Wdata',ey(3));
    set(qz, 'XData', TS_POS_I(i,1), 'YData', TS_POS_I(i,2), 'ZData', TS_POS_I(i,3), ...
    'Udata',ez(1),'Vdata',ez(2),'Wdata',ez(3));

    drawnow;
end

 