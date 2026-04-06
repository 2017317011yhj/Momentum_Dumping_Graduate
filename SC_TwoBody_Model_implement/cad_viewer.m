clc; close all;

t = out.tout;
SS_POS_I = out.SS_POS_I;

%% STL 파일 경로
stlFile = 'ISS_stationary.stl';   % 파일명만 바꿔서 사용하세요

%% STL 읽기
TR = stlread(stlFile);

scale = 5000;   % 1000배 확대

% 새 triangulation 생성
TR_big = triangulation(TR.ConnectivityList, TR.Points * scale);

figure('Color','w');
ax = axes;
grid on; hold on;

%% Transform 객체 생성
ht = hgtransform('Parent', ax);

%% STL patch 생성 (Parent를 ht로 지정)
h = trisurf(TR_big, ...
    'FaceColor', [1 0 0], ...
    'EdgeColor', 'none', ...
    'FaceAlpha', 1.0, ...
    'Parent', ht);

%% 보기 옵션
xlabel('X [m]');
ylabel('Y [m]');
zlabel('Z [m]');
title('STL Viewer');

camlight('headlight');
camlight('right');
lighting gouraud;
material dull;

% draw earth
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rotate3d on;
n = 600;
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

axis equal;

for i=1:1000:length(t)
    T = makehgtform('translate',SS_POS_I(i,:));
    % Rz = makehgtform('zrotate', yaw);
    % Ry = makehgtform('yrotate', pitch);
    % Rx = makehgtform('xrotate', roll);

    % 적용 순서: 오른쪽부터 먼저 적용
    % ht.Matrix = T * Rz * Ry * Rx;
    ht.Matrix = T;

    drawnow;

end



